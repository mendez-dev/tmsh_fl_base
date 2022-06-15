import 'package:base/src/modules/auth/models/auth_response.dart';
import 'package:base/src/modules/auth/repositories/auth_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:dio/dio.dart';

import '../../../utils/logger.dart';
import '../models/auth_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkRepository _networkRepository;

  AuthRepositoryImpl({required NetworkRepository networkRepository})
      : _networkRepository = networkRepository;

  @override
  Future<AuthResponse> login(
      {required String username, required String password}) async {
    // Preparamos el cuerpo de la petición
    final Map<String, dynamic> data = {
      "username": username,
      "password": password
    };

    final AuthResponseBuilder authResponse = AuthResponseBuilder();
    try {
      final response =
          await _networkRepository.instance.post("/v1/login", data: data);

      authResponse.code = response.statusCode ?? 500;
      authResponse.message = response.statusMessage ?? "";
      authResponse.auth = AuthModel.fromJson(response.data)!.toBuilder();

      logger.v(response);
      return authResponse.build();
    } on DioError catch (error) {
      return AuthResponse.fromJson(_catchingErrors(error))!;
    } catch (e) {
      return AuthResponse((a) => a
        ..code = 500
        ..message = "No se pudo realizar la petición");
    }
  }

  // ---------------------------------------------------------------------------
  /// Se encarga de manejar la captura de errores en las peticiones HTTP
  Map<String, dynamic> _catchingErrors(DioError error) {
    if (error.type == DioErrorType.response) {
      logger.i(error.response);
      return {
        "code": error.response!.data["code"],
        "message": error.response!.data["message"]
      };
    }

    logger.e("ERROR EN EL SERVIDOR");
    // ignore: avoid_print
    print(error);
    return {"code": 500, "message": "No se pudo establecer conexión"};
  }
}
