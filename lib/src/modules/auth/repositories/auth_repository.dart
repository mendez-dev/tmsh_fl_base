import '../models/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(
      {required String username, required String password});
}
