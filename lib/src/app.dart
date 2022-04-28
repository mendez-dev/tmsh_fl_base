import 'package:base/src/modules/auth/bloc/bloc/auth_bloc.dart';
import 'package:base/src/modules/auth/repositories/auth/auth_repository.dart';
import 'package:base/src/modules/auth/repositories/auth/auth_repository_impl.dart';
import 'package:base/src/modules/settings/helpers/theme_helpers.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/settings/bloc/settings/settings_bloc.dart';
import 'modules/settings/repositories/preferences/preferences_repository.dart';
import 'modules/settings/repositories/settings/settings_repository.dart';
import 'routers/application.dart';
import 'routers/routes.dart';

class MyApp extends StatelessWidget {
  MyApp(
      {Key? key,
      required this.settingsRepository,
      // required this.networkRepository,
      required this.preferencesRepository,
      required this.settingsBloc
      // required this.colors
      })
      : super(key: key) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  final SettingsRepository settingsRepository;
  // final NetworkRepository networkRepository;
  final PreferencesRepository preferencesRepository;
  final SettingsBloc settingsBloc;
  // final ColorsHelper colors;

  @override
  Widget build(BuildContext context) {
    // Se realiza la inyección de dependencias mediante repository provider y
    // bloc provider
    return MultiRepositoryProvider(
      providers: [
        // Preferences repository se encarga de la interacción con el local storage
        RepositoryProvider<PreferencesRepository>.value(
            value: preferencesRepository),
        // Gestiona las funciones de ajustes de la aplicación
        RepositoryProvider<SettingsRepository>.value(value: settingsRepository),
        RepositoryProvider<AuthRepository>(
          create: (BuildContext context) => AuthRepositoryImpl(),
        ),
        RepositoryProvider(create: (BuildContext context) => NetworkRepository(preferences: RepositoryProvider.of<PreferencesRepository>(context)))
      ],
      child: MultiBlocProvider(
        providers: [
          // Bloc que se encarga de mantener el estado de las configuraciones de
          // la app haciendo uso de las funciones proporcionadas por
          // preferences repository
          BlocProvider<SettingsBloc>.value(value: settingsBloc),
          BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(
                  preferencesRepository: preferencesRepository,
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context)))
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (BuildContext context, SettingsState state) {
            return MaterialApp(
              title: 'Material App',
              theme: getThemeData(context: context, theme: state.theme),
              initialRoute: 'splash',
              onGenerateRoute: Application.router!.generator,
            );
          },
        ),
      ),
    );
  }
}
