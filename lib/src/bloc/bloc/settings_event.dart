part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {}

/// Lee desde las preferencias del sistema el tema seleccionado y lo guarda en
/// el estado de los ajustes de la aplicación
class GetInitialConfigEvent implements SettingsEvent {
  final ThemeModel theme;
  final SettingsModel settings;

  GetInitialConfigEvent({required this.theme, required this.settings});

  @override
  List<Object?> get props => [theme, settings];

  @override
  bool? get stringify => true;
}
