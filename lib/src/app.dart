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
        RepositoryProvider<NetworkRepository>(
            create: ((context) => NetworkRepository(
                preferences:
                    RepositoryProvider.of<PreferencesRepository>(context))))
      ],
      child: MultiBlocProvider(
        providers: [
          // Bloc que se encarga de mantener el estado de las configuraciones de
          // la app haciendo uso de las funciones proporcionadas por
          // preferences repository
          BlocProvider<SettingsBloc>.value(value: settingsBloc),
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (BuildContext context, SettingsState state) {
            return MaterialApp(
              title: 'Material App',
              theme: getThemeData(context: context, theme: state.theme),
              initialRoute: 'home',
              onGenerateRoute: Application.router!.generator,
            );
          },
        ),
      ),
    );
  }
}
