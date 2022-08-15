import '../../models/theme_model.dart';

/// Permite leer y escribir en las preferencias del usuario
abstract class PreferencesRepository {
  /// Nos permite escribir un valor primitivo en el [local storage] independientemente
  /// del valor que sea este se guardara como [String]
  Future<void> save<Type>(String key, Type value);

  /// Elimina el valor que se indique del [local storage]
  Future<void> remove(String value);

  /// Busca un valor en el [local storage] y devuelve su información como un [String]
  Future<String?> getString(String key);

  /// Almacena el token de acceso en el [local storage]
  Future<void> saveAuthToken(String value);

  /// Busca en [local storage] el valor del token de acceso
  Future<String?> getAuthToken();

  /// Retorna el tema guardado en el [local storage] si no se a seleccionado ningún
  /// tema devolverá el tema claro por defecto
  Future<ThemeModel> getTheme();

  /// Guarda la información del tema en el [local storage]
  Future<void> setTheme(ThemeModel theme);

  /// Retorna la url base donde hará las peticiones HTTP
  Future<String> getBaseUrl();

  /// Lee un valor booleano en el  [local storage]
  Future<bool> getBool(String key);

  /// Retorna la ruta inicial de la aplicacion
  Future<String> getInitialRoute();
}
