part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool settingsLoaded;
  final ThemeModel theme;
  final SettingsModel? settings;

  const SettingsState(
      {required this.settingsLoaded,
      required this.theme,
      required this.settings});

  factory SettingsState.initial() {
    return const SettingsState(
        settingsLoaded: false, theme: ThemeModel.dark, settings: null);
  }

  SettingsState copyWith({
    bool? settingsLoaded,
    ThemeModel? theme,
    SettingsModel? settings,
  }) {
    return SettingsState(
        settingsLoaded: settingsLoaded ?? this.settingsLoaded,
        theme: theme ?? this.theme,
        settings: settings ?? this.settings);
  }

  @override
  List<Object> get props => [settingsLoaded, theme];
}
