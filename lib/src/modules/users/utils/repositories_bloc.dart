import 'package:base/src/modules/users/repositories/user_repository_impl.dart';
import 'package:base/src/modules/users/repositories/user_repository_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/user_repository.dart';
import '../../settings/repositories/preferences/preferences_repository.dart';
import '../../../repositories/network/network_repository.dart';
import '../../../repositories/database_repository/database_repository.dart';

// Repositorios del modulo usuarios
List<RepositoryProvider> usersRepositoryProviders = [
  RepositoryProvider<UserRepository>(
    create: (context) => UserRepositoryImpl(
        preferences: RepositoryProvider.of<PreferencesRepository>(context),
        database: RepositoryProvider.of<DatabaseRepository>(context),
        network: RepositoryProvider.of<NetworkRepository>(context)),
  ),
  RepositoryProvider<UserRepositoryLocal>(
      create: (context) => UserRepositoryLocal(
            preferences: RepositoryProvider.of<PreferencesRepository>(context),
            database: RepositoryProvider.of<DatabaseRepository>(context),
          )),
];
