import '../../models/settings_model.dart';
import '../preferences/preferences_repository.dart';

import 'settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final PreferencesRepository _pref;

  SettingsRepositoryImpl({required PreferencesRepository pref}) : _pref = pref;

  @override
  Future<SettingsModel> initSettings() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // En caso de no poder leer las configuraciones iniciales usara unas por
    // defecto
    SettingsModel defaultSettings = SettingsModel((s) => s
      ..appName = "BASE APP"
      ..defaultTax = 0.13
      ..defaultCurrency = "\$"
      ..mainColor = "#B63ECB"
      ..mainDarkColor = "#CB54DF"
      ..secondColor = "#344968"
      ..secondDarkColor = "#ccccdd"
      ..accentColor = "#8C98A8"
      ..accentDarkColor = "#9999aa"
      ..scaffoldColor = "#EFEFF4"
      ..scaffoldDarkColor = "#2C2C2C");

    return defaultSettings;
  }
}
