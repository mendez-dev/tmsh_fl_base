import 'package:base/src/modules/auth/repositories/auth/auth_repository.dart';
import 'package:base/src/utils/logger.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<String?> login(
      {required String email, required String password}) async {
    try {
      final response = await Dio().post('https://reqres.in/api/login',
          options: Options(contentType: "application/json"),
          // data: {email: email, password: password}
          data: {'email': 'eve.holt@reqres.in', 'password': 'cityslic222555ka'});

      logger.v(response);
    } on DioError catch (error) {
      logger.e(error);
    }
  }
}
