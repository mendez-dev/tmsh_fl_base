
import '../../models/settings_model.dart';

abstract class SettingsRepository {
  Future<SettingsModel> initSettings();
}
