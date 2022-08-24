import 'package:base/src/modules/users/models/users_pagination_response.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';

import '../../../models/data_origin.dart';

class UserRepositoryApi implements UserRepository {
  final NetworkRepository _network;

  UserRepositoryApi({required NetworkRepository network}) : _network = network;

  @override
  Future<UsersPaginationResponse> getUserPagination(
      {int page = 1,
      int recordsPerPage = 10,
      String query = "",
      DataOrigin dataOrigin = DataOrigin.web}) async {
    final response = await _network.instance.get('/v1/user', queryParameters: {
      'page': page,
      'records_per_page': recordsPerPage,
      'firstname': query,
      'lastname': query,
      'email': query,
    });

    final UsersPaginationResponse? usersPaginationResponse =
        UsersPaginationResponse.fromJson(response.data);

    return usersPaginationResponse!;
  }

  @override
  Future<bool> downloadBatch({int page = 1}) async {
    return true;
  }
}
