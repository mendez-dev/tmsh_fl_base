import '../models/users_pagination.dart';

abstract class UserRepository {
  Future<UsersPagination> getUserPagination(
      {int page = 1, int recordsPerPage = 10, String query = ""});
}
