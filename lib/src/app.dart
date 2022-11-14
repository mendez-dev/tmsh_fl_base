import 'package:base/src/modules/async/utils/repositories_blocs.dart';
import 'package:base/src/modules/auth/bloc/bloc/auth_bloc.dart';
import 'package:base/src/modules/auth/repositories/auth_repository.dart';
import 'package:base/src/modules/auth/repositories/auth_repository_local.dart';
import 'package:base/src/modules/auth/repositories/auth_repository_net.dart';
import 'package:base/src/modules/settings/helpers/theme_helpers.dart';
import 'package:base/src/modules/users/utils/repositories_bloc.dart';
import 'package:base/src/repositories/database_repository/database_repository.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:base/src/utils/logger.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/settings/bloc/settings/settings_bloc.dart';
import 'modules/settings/repositories/preferences/preferences_repository.dart';
import 'modules/settings/repositories/settings/settings_repository.dart';
import 'routers/application.dart';
import 'routers/routes.dart';

class MyApp extends StatelessWidget {
  MyApp(
      {Key? key,
      required this.settingsRepository,
      required this.preferencesRepository,
      required this.settingsBloc,
      required this.initialRoute,
      required this.databaseRepository,
      required this.authBloc})
      : super(key: key) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  // Repositorios que se cargan antes de la creacion de la aplicacion
  final SettingsRepository settingsRepository;
  final PreferencesRepository preferencesRepository;
  final DatabaseRepository databaseRepository;

  // Blocs que se cargan antes de la creacion de la aplicacion
  final SettingsBloc settingsBloc;
  final AuthBloc authBloc;

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    // Se realiza la inyección de dependencias mediante repository provider y
    // bloc provider
    return BlocProvider<SettingsBloc>(
      create: (context) => settingsBloc,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider<DatabaseRepository>.value(
                  value: databaseRepository),
              // Preferences repository se encarga de la interacción con el local storage
              RepositoryProvider<PreferencesRepository>.value(
                  value: preferencesRepository),
              // Gestiona las funciones de ajustes de la aplicación
              RepositoryProvider<SettingsRepository>.value(
                  value: settingsRepository),
              RepositoryProvider<NetworkRepository>(
                  create: ((context) => NetworkRepository(
                      preferences: RepositoryProvider.of<PreferencesRepository>(
                          context)))),
              RepositoryProvider<AuthRepository>(
                  create: (BuildContext context) {
                if (state.dataSource == 'NETWORK') {
                  logger.i('NETWORK CARGADO');
                  return AuthRepositoryNet(
                      networkRepository:
                          RepositoryProvider.of<NetworkRepository>(context));
                } else {
                  logger.i('LOCAL CARGADO');
                  return AuthRepositoryLocal(
                      databaseRepository:
                          RepositoryProvider.of<DatabaseRepository>(context),
                      preferencesRepository:
                          RepositoryProvider.of<PreferencesRepository>(
                              context));
                }
              }),
              ...asyncRepositoryProviders,

              ...usersRepositoryProviders
            ],
            child: MultiBlocProvider(
                providers: [
                  // Bloc que se encarga de mantener el estado de las configuraciones de
                  // la app haciendo uso de las funciones proporcionadas por
                  // preferences repository
                  BlocProvider<AuthBloc>.value(value: authBloc),
                  ...asyncBlocProviders
                ],
                child: MaterialApp(
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const <Locale>[
                    Locale('es', ''),
                  ],
                  title: 'Material App',
                  theme: getThemeData(context: context, theme: state.theme),
                  initialRoute: initialRoute,
                  onGenerateRoute: Application.router!.generator,
                )),
          );
        },
      ),
    );
  }
}
