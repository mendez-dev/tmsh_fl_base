import 'package:base/src/modules/auth/models/auth_response.dart';
import 'package:base/src/modules/auth/repositories/auth_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/logger.dart';

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

    final response =
        await _networkRepository.instance.post("/v1/login", data: data);

    AuthResponse? auth = AuthResponse.fromJson(response.data);

    return auth!;
  }

  // ---------------------------------------------------------------------------
  /// Se encarga de manejar la captura de errores en las peticiones HTTP
  Map<String, dynamic> _catchingErrors(DioError error) {
    Map<String, dynamic> response = <String, dynamic>{};
    if (error.type == DioErrorType.response) {
      logger.i(error.response);
      response = {
        "code": error.response!.data["code"],
        "message": error.response!.data["message"]
      };
    } else {
      logger.e("ERROR EN EL SERVIDOR");
      // ignore: avoid_print
      print(error);
      response = {"code": 500, "message": "No se pudo establecer conexión"};
    }

    Fluttertoast.showToast(msg: response["message"]);

    return response;
  }
}
