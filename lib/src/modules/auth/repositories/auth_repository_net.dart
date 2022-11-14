import 'package:base/src/modules/auth/models/auth_response.dart';
import 'package:base/src/modules/auth/repositories/auth_repository.dart';
import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/user_response.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:built_collection/built_collection.dart';

import '../../../utils/logger.dart';

class AuthRepositoryNet implements AuthRepository {
  final NetworkRepository _networkRepository;

  AuthRepositoryNet({required NetworkRepository networkRepository})
      : _networkRepository = networkRepository;

  @override
  Future<AuthResponse> login(
      {required String username, required String password}) async {
    // Preparamos el cuerpo de la petición
    final Map<String, dynamic> data = {
      "username": username,
      "password": password
    };

    final response =
        await _networkRepository.instance.post("/v1/login", data: data);

    AuthResponse? auth = AuthResponse.fromJson(response.data);

    return auth!;
  }

  @override
  Future<UserResponse> verify() async {
    ListBuilder<String> errors = ListBuilder<String>();
    final response = await _networkRepository.instance.get("/v1/verify");

    UserModel? user = UserModel.fromJson(response.data['data']);
    if (user == null) {
      errors.add("Error al obtener los datos del usuario");
    } else {
      logger.i("Autenticación con el servidor");
      logger.v(user);
    }

    return UserResponse((u) => u
      ..code = response.statusCode
      ..message = response.statusMessage
      ..data = user?.toBuilder()
      ..errors = errors);
  }
}
