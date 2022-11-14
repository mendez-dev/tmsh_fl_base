part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {}

/// Lee desde las preferencias del sistema el tema seleccionado y lo guarda en
/// el estado de los ajustes de la aplicación
class GetInitialConfigEvent implements SettingsEvent {
  final ThemeModel theme;
  final SettingsModel settings;
  final String dataSource;

  GetInitialConfigEvent(
      {required this.theme,
      required this.settings,
      this.dataSource = 'NETWORK'});

  @override
  List<Object?> get props => [theme, settings, dataSource];

  @override
  bool? get stringify => true;
}

/// Establese el tema de la aplicación
class SetDarkModeEvent implements SettingsEvent {
  final bool value;

  SetDarkModeEvent(this.value);
  @override
  List<Object?> get props => [value];

  @override
  bool? get stringify => true;
}
