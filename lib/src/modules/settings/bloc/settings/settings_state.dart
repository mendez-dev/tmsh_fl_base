part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool settingsLoaded;
  final String dataSource;
  final ThemeModel theme;
  final SettingsModel? settings;

  const SettingsState(
      {required this.settingsLoaded,
      required this.theme,
      required this.dataSource,
      required this.settings});

  factory SettingsState.initial() {
    return const SettingsState(
        settingsLoaded: false,
        dataSource: 'NETWORK',
        theme: ThemeModel.dark,
        settings: null);
  }

  SettingsState copyWith({
    bool? settingsLoaded,
    ThemeModel? theme,
    String? dataSource,
    SettingsModel? settings,
  }) {
    return SettingsState(
        settingsLoaded: settingsLoaded ?? this.settingsLoaded,
        theme: theme ?? this.theme,
        dataSource: dataSource ?? this.dataSource,
        settings: settings ?? this.settings);
  }

  @override
  List<Object> get props => [settingsLoaded, theme, dataSource];
}
