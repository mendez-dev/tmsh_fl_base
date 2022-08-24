import 'package:base/src/models/data_origin.dart';
import 'package:base/src/modules/users/models/users_pagination_response.dart';

import '../models/users_pagination.dart';

abstract class UserRepository {
  Future<UsersPaginationResponse> getUserPagination(
      {int page = 1,
      int recordsPerPage = 10,
      String query = "",
      DataOrigin dataOrigin = DataOrigin.web});

  Future<bool> downloadBatch({int page = 1});
}
