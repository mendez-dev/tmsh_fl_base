import 'package:base/src/modules/auth/bloc/bloc/auth_bloc.dart';
import 'package:base/src/repositories/database_repository/database_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'src/app.dart';
import 'src/modules/auth/repositories/auth_repository_local.dart';
import 'src/modules/auth/repositories/auth_repository_net.dart';
import 'src/modules/settings/bloc/settings/settings_bloc.dart';
import 'src/modules/settings/models/settings_model.dart';
import 'src/modules/settings/models/theme_model.dart';
import 'src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'src/modules/settings/repositories/preferences/preferences_repository_impl.dart';
import 'src/modules/settings/repositories/settings/settings_repository.dart';
import 'src/modules/settings/repositories/settings/settings_repository_impl.dart';
import 'src/utils/logger.dart';

void main() async {
  // Se utiliza WidgetsFlutterBinding para ejecutar código antes que se dibuje
  // el primer widget
  WidgetsFlutterBinding.ensureInitialized();
  // Leemos las configuraciones globales desde 'assets/cfg/configurations'
  await GlobalConfiguration().loadFromAsset("configurations");

  // Cargamos el PreferencesRepository y El Settings bloc para leer los ajustes
  // iniciales de la aplicación, como el tema seleccionado
  PreferencesRepository preferencesRepository = PreferencesRepositoryImpl();
  SettingsRepository settingsRepository =
      SettingsRepositoryImpl(pref: preferencesRepository);

  SettingsBloc settingsBloc = SettingsBloc(
      preferencesRepository: preferencesRepository,
      settingsRepository: settingsRepository);

  // Leemos los ajustes y el tema por defecto
  ThemeModel theme = await preferencesRepository.getTheme();
  SettingsModel settings = await settingsRepository.initSettings();
  String initialRoute = await preferencesRepository.getInitialRoute();
  String dataSource = await preferencesRepository.getDataSource();
  logger.v(settings);

  settingsBloc.add(GetInitialConfigEvent(
      theme: theme, settings: settings, dataSource: dataSource));

  // Cargamos la base de datos local

  final DatabaseRepository databaseRepository = DatabaseRepository(version: 1);
  databaseRepository.initDB();

  AuthBloc authBloc = AuthBloc(
      preferencesRepository: preferencesRepository,
      authRepository: dataSource == "NETWORK"
          ? AuthRepositoryNet(
              networkRepository:
                  NetworkRepository(preferences: preferencesRepository),
            )
          : AuthRepositoryLocal(
              databaseRepository: databaseRepository,
              preferencesRepository: preferencesRepository));

  // Verificamos si el usuario ya está autenticado
  bool isLogged = await preferencesRepository.getBool('is_logged');

  if (isLogged) {
    authBloc.add(VerifyEvent());
  }

  runApp(MyApp(
    databaseRepository: databaseRepository,
    settingsRepository: settingsRepository,
    settingsBloc: settingsBloc,
    preferencesRepository: preferencesRepository,
    initialRoute: initialRoute,
    authBloc: authBloc,
  ));
}
