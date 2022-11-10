import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'package:base/src/modules/users/models/users_pagination_response.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:base/src/repositories/database_repository/database_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:built_collection/built_collection.dart';

import '../../../models/data_origin.dart';
import '../../../utils/logger.dart';
import '../models/user_model.dart';
import '../models/users_pagination.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkRepository _network;
  final DatabaseRepository _database;
  final PreferencesRepository _preferences;

  UserRepositoryImpl(
      {required NetworkRepository network,
      required DatabaseRepository database,
      required PreferencesRepository preferences})
      : _network = network,
        _database = database,
        _preferences = preferences;

  @override
  Future<UsersPagination> getUserPagination({
    int page = 1,
    int recordsPerPage = 10,
    String query = "",
  }) async {
    // Identificamos el origen de los datos
    final DataOrigin dataOrigin = await _preferences.getDataOrigin();

    if (dataOrigin == DataOrigin.remote) {
      // Si los datos son remotos los obtenemos de la API
      final response =
          await _network.instance.get('/v1/user', queryParameters: {
        'page': page,
        'records_per_page': recordsPerPage,
        'firstname': query,
        'lastname': query,
        'email': query,
      });

      final UsersPaginationResponse? usersPaginationResponse =
          UsersPaginationResponse.fromJson(response.data);

      if (usersPaginationResponse != null) {
        return usersPaginationResponse.data!;
      }
    } else {
      // Si los datos son locales los obtenemos de la base de datos
      final response = await _database.getPaginated(
          table: 'user', page: page, recordsPerPage: recordsPerPage);

      return UsersPagination.fromJson(response)!;
    }

    // Retornamos los datos
    return UsersPagination((u) => u
      ..data = ListBuilder<UserModel>()
      ..currentPage = 0
      ..totalPages = 0);
  }
}
