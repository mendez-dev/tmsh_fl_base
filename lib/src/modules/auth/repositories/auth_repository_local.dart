import 'package:base/src/helpers/password_helper.dart';
import 'package:base/src/modules/auth/models/auth_model.dart';
import 'package:base/src/modules/auth/models/auth_response.dart';
import 'package:base/src/modules/auth/repositories/auth_repository.dart';
import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'package:base/src/modules/users/models/user_response.dart';
import 'package:base/src/repositories/database_repository/database_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/logger.dart';
import '../../users/models/user_model.dart';

class AuthRepositoryLocal implements AuthRepository {
  final DatabaseRepository _databaseRepository;
  final PreferencesRepository _preferencesRepository;

  AuthRepositoryLocal(
      {required DatabaseRepository databaseRepository,
      required PreferencesRepository preferencesRepository})
      : _databaseRepository = databaseRepository,
        _preferencesRepository = preferencesRepository;

  @override
  Future<AuthResponse> login(
      {required String username, required String password}) async {
    String passwordHash = await encryptPassword(password);
    AuthModelBuilder authModelBuilder = AuthModelBuilder();

    final response = await _databaseRepository.db!.query("user",
        where: "username = ? AND password_hash = ?",
        whereArgs: [username.toUpperCase(), passwordHash]);

    if (response.isNotEmpty) {
      authModelBuilder.token = response.first["id_user"].toString();
      return AuthResponse((a) => a
        ..code = 200
        ..message = "Login correcto"
        ..data = authModelBuilder);
    } else {
      authModelBuilder.errors.add("Usuario o contraseña incorrectos");
      Fluttertoast.showToast(msg: "Usuario o contraseña incorrectos");
      return AuthResponse((a) => a
        ..code = 401
        ..message = "Credenciales incorrectas");
    }
  }

  @override
  Future<UserResponse> verify() async {
    ListBuilder<String> errors = ListBuilder<String>();
    // Obtenemos el id del usuario logeado desde las preferencias de la aplicación
    String? idUser = await _preferencesRepository.getUserId();
    if (idUser == null) {
      errors.add("No se ha encontrado el id del usuario");
      return UserResponse((u) => u
        ..code = 400
        ..message = "No se ha encontrado el id del usuario"
        ..errors = errors);
    }

    final response = await _databaseRepository.find(table: "user", id: idUser);
    if (response != null) {
      UserModel? user = UserModel.fromJson(response);
      if (user == null) {
        errors.add("Error al obtener los datos del usuario");
      }

      logger.i("Autenticación con base de datos local");
      logger.v(user);

      return UserResponse((u) => u
        ..code = 200
        ..message = "Usuario encontrado"
        ..data = user?.toBuilder()
        ..errors = errors);
    } else {
      errors.add("No se ha encontrado el usuario");
      return UserResponse((u) => u
        ..code = 400
        ..message = "No se ha encontrado el usuario"
        ..errors = errors);
    }
  }
}
