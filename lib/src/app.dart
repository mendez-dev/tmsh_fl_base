import 'package:base/src/bloc/bloc/settings_bloc.dart';
import 'package:base/src/helpers/theme_helpers.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:base/src/repositories/preferences/preferences_repository.dart';
import 'package:base/src/repositories/preferences/preferences_repository_impl.dart';
import 'package:base/src/repositories/settings/settings_repository.dart';
import 'package:base/src/repositories/settings/settings_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_configuration/global_configuration.dart';

class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key,
      required this.settingsRepository,
      // required this.networkRepository,
      required this.preferencesRepository,
      required this.settingsBloc
      // required this.colors
      })
      : super(key: key);

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
        RepositoryProvider<SettingsRepository>.value(value: settingsRepository)
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
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('Material App Bar'),
                ),
                body: Center(
                  child: Text(
                      GlobalConfiguration().getValue<String>('api_base_url')),
                ),
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
