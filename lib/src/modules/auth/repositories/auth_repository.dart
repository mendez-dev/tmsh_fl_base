import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/user_response.dart';

import '../models/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(
      {required String username, required String password});

  Future<UserResponse> verify();
}
