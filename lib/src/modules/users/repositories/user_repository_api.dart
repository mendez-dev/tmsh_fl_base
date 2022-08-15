import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/users_pagination_response.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:built_collection/built_collection.dart';

import '../models/users_pagination.dart';

class UserRepositoryApi implements UserRepository {
  final NetworkRepository _network;

  UserRepositoryApi({required NetworkRepository network}) : _network = network;

  @override
  Future<UsersPagination> getUserPagination(
      {int page = 1, int recordsPerPage = 10, String query = ""}) async {
    final response = await _network.instance.get('/v1/user', queryParameters: {
      'page': page,
      'records_per_page': recordsPerPage,
      'firstname': query,
      'lastname': query,
      'email': query,
    });

    final UsersPaginationResponse? usersPaginationResponse =
        UsersPaginationResponse.fromJson(response.data);

    if (usersPaginationResponse?.data != null) {
      return usersPaginationResponse!.data!;
    }

    return UsersPagination((b) => b
      ..data = ListBuilder<UserModel>()
      ..currentPage = 0
      ..totalPages = 0);
  }
}
