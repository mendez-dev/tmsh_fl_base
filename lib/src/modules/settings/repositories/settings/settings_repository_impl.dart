import '../../models/settings_model.dart';

import 'settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  @override
  Future<SettingsModel> initSettings() async {
    // Load defaul app settings
    SettingsModel defaultSettings = SettingsModel((s) => s
      ..appName = "My movie app"
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
