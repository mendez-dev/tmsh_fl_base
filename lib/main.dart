
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'src/app.dart';
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

  logger.v(settings);

  settingsBloc.add(GetInitialConfigEvent(theme: theme, settings: settings));

  runApp(MyApp(
    settingsRepository: settingsRepository,
    settingsBloc: settingsBloc,
    preferencesRepository: preferencesRepository,
  ));
}
