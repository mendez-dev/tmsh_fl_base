import 'package:base/src/models/data_origin.dart';
import 'package:global_configuration/global_configuration.dart';
import '../../../../utils/logger.dart';
import 'preferences_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:string_validator/string_validator.dart';

import '../../models/theme_model.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  // Instancia de FlutterSourceStorage que nos permitirá leer y escribir en las
  // preferencias del usuario
  late FlutterSecureStorage _storage;

  /// Almacena el indice con el que se guardara y leerá el token de acceso
  final String _authToken = 'authToken';

  final String _isUser = 'id_user';

  /// Almacena el indice con el que se guardara y leerá el tema
  final String _themeIndexKey = 'themeIndex';

  /// Almacena el indice con el que se guardara y leerá ka url base
  final String _baseUrl = 'baseUrl';

  // Creamos nuestra instancia de FlutterSecureStorage en el constructor de
  // nuestra clase
  PreferencesRepositoryImpl() {
    // Indicamos las opciones que se usaran en android
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );

    // Asignamos nuestra instancia de la clase
    _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  @override
  Future<String?> getString(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> remove(String value) async {
    await _storage.delete(key: value);
  }

  @override
  Future<void> save<Type>(String key, Type value) async {
    if (value is String) {
      _storage.write(key: key, value: value);
    } else {
      _storage.write(key: key, value: toString(value));
    }
  }

  @override
  Future<String?> getAuthToken() async {
    return Future.value(await _storage.read(key: _authToken));
  }

  @override
  Future<void> saveAuthToken(String value) async {
    await _storage.write(key: _authToken, value: value);
  }

  @override
  Future<ThemeModel> getTheme() async {
    final value = await _storage.read(key: _themeIndexKey);

    if (value != null) {
      return ThemeModel.valueOf(value);
    } else {
      return ThemeModel.light;
    }
  }

  @override
  Future<void> setTheme(ThemeModel theme) async {
    _storage.write(key: _themeIndexKey, value: theme.name);
  }

  @override
  Future<String> getBaseUrl() async {
    String? baseUrl = await getString(_baseUrl);

    if (baseUrl != null) {
      return baseUrl;
    }

    return GlobalConfiguration().getValue<String>('api_base_url');
  }

  @override
  Future<bool> getBool(String key) async {
    final String? value = await _storage.read(key: key);

    if (value != null) {
      return Future.value(toBoolean(value, true));
    }

    return Future.value(false);
  }

  @override
  Future<String> getInitialRoute() async {
    final String? value = await _storage.read(key: 'initial_route');
    if (value != null) {
      return value;
    }
    return 'login';
  }

  @override
  Future<DataOrigin> getDataOrigin() async {
    final String? value = await _storage.read(key: 'data_origin');
    if (value != null) {
      if (value == 'remote') {
        return DataOrigin.remote;
      }
    }
    return DataOrigin.local;
  }

  @override
  Future<void> saveUserId(String value) async {
    logger.i('saveUserId: $value');
    await _storage.write(key: _isUser, value: value);
  }

  @override
  Future<String?> getUserId() async {
    return Future.value(await _storage.read(key: _isUser));
  }
}
