import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';
import '../../modules/settings/repositories/preferences/preferences_repository.dart';


/// Librería que nos permite realizar peticiones HTTP utilizando DIO
class NetworkRepository {
  /// Instancia de preferences repository que nos permite leer el base url y el
  /// token de acceso
  final PreferencesRepository preferences;
  Dio? _network;
  BaseOptions? _options;

  NetworkRepository({
    required this.preferences,
  }) {
    // Creamos nuestra instancia de DIO
    _network = Dio(_options);

    /// Establecemos las propiedades a la instancia de DIO
    _network!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Obtenemos el token de acceso
          final String? token = await preferences.getAuthToken();
          // Obtenemos la url base
          final String baseUrl = await preferences.getBaseUrl();

          final String apiKey = await GlobalConfiguration().get('api_key');

          // Agregamos el token a el header de las peticiones
          options.headers['Authorization'] = "Bearer $token";
          // Establecemos nuestra url base
          options.baseUrl = baseUrl;
          options.queryParameters = {'api_key': apiKey};

          // Establecemos el content type
          if (options.contentType != "multipart/form-data") {
            options.headers['Content-Type'] = "application/json";
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );
  }

  void addInterceptor(Interceptor interceptor) {
    _network!.interceptors.add(interceptor);
  }

  Dio? get instance => _network;
}
