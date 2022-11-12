import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'package:base/src/modules/users/models/user_create.dart';
import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/users_pagination.dart';
import 'package:base/src/modules/users/models/user_response.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:base/src/repositories/database_repository/database_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:uuid/uuid.dart';

class UserRepositoryLocal implements UserRepository {
  final DatabaseRepository _database;
  final PreferencesRepository _preferences;

  UserRepositoryLocal({required database, required preferences})
      : _database = database,
        _preferences = preferences;

  @override
  Future<UserResponse> createUser(UserCreate user) async {
    ListBuilder<String> errors = ListBuilder<String>();
    // Obtenemos el id del usuario
    final String id = Uuid().v4();

    // Obtenemos el id del usuario
    final String? userId = await _preferences.getUserId();

    if (userId == null) {
      errors.add('No se ha podido obtener el id del usuario');
    }

    // Verificamos que el correo no exista
    final List<Map<String, dynamic>>? emailExists = await _database.db!.query(
      'user',
      where: 'email = ?',
      whereArgs: [user.email],
    );

    if (emailExists!.isNotEmpty) {
      errors.add('El correo ya existe');
    }

    // Verificamos que el usuario no exista
    final List<Map<String, dynamic>>? userExists = await _database.db!.query(
      'user',
      where: 'username = ?',
      whereArgs: [user.username],
    );

    if (userExists!.isNotEmpty) {
      errors.add('El usuario ya existe');
    }

    if (errors.isNotEmpty) {
      return UserResponse((b) => b
        ..success = false
        ..errors = errors);
    }

    // Obtenemos la fecha actual en string formato ISO
    final String now = DateTime.now().toIso8601String();

    // Creamos el usuario
    final Map<String, dynamic> newUser = {
      'id_user': id,
      'id_user_group': user.idUserGroup,
      'firstname': user.firstname,
      'lastname': user.lastname,
      'username': user.username,
      'email': user.email,
      'password_hash': user.password,
      'picture': '',
      'is_active': 1,
      'created_at': now,
      'updated_at': now,
      'deleted_at': null,
      'created_by': userId,
      'updated_by': userId,
      'deleted_by': null,
      'not_synchronized': 1,
    };

    // Guardamos el usuario
    await _database.db!.insert("user", newUser);

    // Obtenemos el usuario creado
    List<Map<String, dynamic>>? response = await _database.db!.query(
      'user',
      where: 'id_user = ?',
      whereArgs: [id],
    );

    // Convertimos la respuesta a un objeto mutable
    Map<String, dynamic> userCreated = response[0].map((key, value) {
      return MapEntry(key, value);
    });

    if (userCreated['is_active'] == 1) {
      userCreated['is_active'] = true;
    } else {
      userCreated['is_active'] = false;
    }

    return UserResponse((b) => b
      ..success = true
      ..data = UserModel.fromJson(userCreated)!.toBuilder());
  }

  @override
  Future<String> getAdminGroupId() {
    // TODO: implement getAdminGroupId
    throw UnimplementedError();
  }

  @override
  Future<UsersPagination> getUserPagination(
      {int page = 1, int recordsPerPage = 10, String query = ""}) {
    // TODO: implement getUserPagination
    throw UnimplementedError();
  }
}
