import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../modules/settings/repositories/preferences/preferences_repository.dart';
import '../../utils/logger.dart';

/// Implementación de [Dio] para realizar peticiones HTTP
///
/// Se agregan interceptores a [Dio] para el manejo de peticiones,
/// respuestas y errores de las peticiones HTTP.
///
/// Configura el baseUrl y el Bearer token al momento de hacer la
/// petición.
///
/// Se encarga de devolver siempre una respuesta en el formato de
/// ResponseModel, modificando la peticion para que esta siempre
/// contenga el status code, status message y el cuerpo de la respuesta
/// de la siguiente manera.
///
/// ```json
/// {
///   code: 200,
///   message: "ok",
///   data: {}
/// }
/// ```
///
/// En caso de error se maneja la exepción creando un "Fake Response" con
/// el mismo formato del ResponseModel pero con el data vacío de esta forma
/// es mas facil manejar los errores en la parte de la lógica de la aplicación.
class NetworkRepository {
  /// Instancia de preferences repository que nos permite leer el base url y el
  /// token de acceso
  final PreferencesRepository preferences;
  Dio? _network;
  final BaseOptions? _options = BaseOptions(connectTimeout: 2000);

  NetworkRepository({required this.preferences}) {
    // Creamos nuestra instancia de DIO
    _network = Dio(_options);

    /// Establecemos las propiedades a la instancia de DIO
    _network!.interceptors.add(
      InterceptorsWrapper(
          onRequest: _onRequest, onResponse: _onResponse, onError: _onError),
    );
  }

  /// Manejador de peticiones HTTP
  ///
  /// Configura los encabezados de la peticion, agregando el Bearer token
  /// y tambien configura la base_url
  void _onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Obtenemos el token de acceso
    final String? token = await preferences.getAuthToken();
    // Obtenemos la url base
    final String baseUrl = await preferences.getBaseUrl();

    // Agregamos el token a el header de las peticiones
    options.headers['Authorization'] = "Bearer $token";
    // Establecemos nuestra url base
    options.baseUrl = baseUrl;

    // Establecemos el content type
    if (options.contentType != "multipart/form-data") {
      options.headers['Content-Type'] = "application/json";
    }

    return handler.next(options);
  }

  /// Manejador de respuestas HTTP
  ///
  /// Cuando se realiza una peticion http exitosa esta funcion intercepta
  /// la respuesta y cambia su estructura para darle el formato de un
  /// ResponseModel agregando el codigo de la respuesta el mensaje y la data
  /// de la siguiente manera.
  ///
  /// ```json
  /// {
  ///   code: 200,
  ///   message: "ok",
  ///   data: object
  /// }
  /// ```
  ///
  /// De esta forma se maneja un formato de datos mas estandarizado que
  /// facilita el manejo de respuestas en la aplicación.
  void _onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    Map<String, dynamic> data = <String, dynamic>{};

    data = {
      "code": response.statusCode ?? 500,
      "message": response.statusMessage ?? "",
      "data": response.data
    };

    Response<dynamic> newResponse = response;

    newResponse.data = data;

    return handler.next(newResponse);
  }

  /// Manejador de errores HTTP
  ///
  /// Captura el error al momento de hacer una petición ya sea por una
  /// respuesta de el servidor, error en el servidor o porque no se pudo
  /// realizar la petición.
  ///
  /// En caso de que sea una respuesta del servidor con un mensaje de error
  /// la captura y le da el formato de un ResponseModel para que sea mas
  /// facil manejar el error desde la logica de la aplicación.
  ///
  /// En caso de no resivir respuesta ya sea por error en el servidor o porque
  /// no se pudo realizar la petición se crea una respuesta falsa para que la
  /// aplicación pueda continuar funcionando sin romperse.
  void _onError(DioError error, ErrorInterceptorHandler handler) {
    // Almacenara nuestro "fake response"
    Response<dynamic> response;

    String message = "";
    int code = 500;

    if (error.type == DioErrorType.response) {
      logger.e("DIO TYPE ERROR");
      // Si el error viene desde el servidor se reestructura la data

      if (error.response!.data["errors"] != null) {
        String errorType =
            error.response!.data["errors"].runtimeType.toString();

        // Evaluamos el tipo de datos del error
        switch (errorType) {
          case 'List<dynamic>':
            List<dynamic> errors = error.response!.data["errors"];
            message = errors.first.toString();
            break;
          case 'String':
            message = error.response!.data["errors"];
            break;
          default:
        }
      } else {
        message = error.response!.statusMessage ??
            "Error: No se pudo manejar la respuesta";
      }

      if (error.response!.statusCode != null) {
        code = error.response!.statusCode!;
      }

      response = Response(requestOptions: error.requestOptions, data: {
        "code": error.response!.statusCode ?? 500,
        "message": error.response!.statusMessage ??
            "Error: No se pudo manejar la respuesta"
      });
    } else {
      // Si el error es al generar la petición se crea un "fake response"
      logger.e("SERVER ERROR");
      logger.v(error);
      // ignore: avoid_print
      response = Response(
          requestOptions: error.requestOptions,
          data: {"code": 500, "message": "No se pudo establecer conexión"});

      message = "No se pudo establecer conexión";
    }

    if (code != 404) {
      Fluttertoast.showToast(msg: message);
    }

    print(error.response);

    return handler.resolve(response);
  }

  /// Retorna la instancia de [Dio] configurada
  Dio get instance => _network!;
}
