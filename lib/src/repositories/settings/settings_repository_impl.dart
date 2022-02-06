import 'package:base/src/models/settings_model.dart';
import 'package:base/src/repositories/preferences/preferences_repository.dart';
import 'package:base/src/repositories/settings/settings_repository.dart';

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
      ..mainColor = "#FF4E6A"
      ..mainDarkColor = "#ea5c44"
      ..secondColor = "#344968"
      ..secondDarkColor = "#ccccdd"
      ..accentColor = "#8C98A8"
      ..accentDarkColor = "#9999aa"
      ..scaffoldColor = "#FAFAFA"
      ..scaffoldDarkColor = "#2C2C2C");

    return defaultSettings;
  }
}
