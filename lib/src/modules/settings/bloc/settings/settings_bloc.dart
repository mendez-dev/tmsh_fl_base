import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../models/settings_model.dart';
import '../../models/theme_model.dart';
import '../../repositories/settings/settings_repository.dart';
import '../../repositories/preferences/preferences_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final PreferencesRepository _pref;
  final SettingsRepository _settings;

  SettingsBloc(
      {required PreferencesRepository preferencesRepository,
      required SettingsRepository settingsRepository})
      : _pref = preferencesRepository,
        _settings = settingsRepository,
        super(SettingsState.initial()) {
    on<SettingsEvent>((event, emit) {});
    on<GetInitialConfigEvent>(_onGetInitialConfigEventToState);
    on<SetDarkModeEvent>(_onSetDarkModeEventToState);
  }

  // Actualiza el estado del bloc al ejecutar el evento GetInitialConfigEvent
  void _onGetInitialConfigEventToState(
      GetInitialConfigEvent event, Emitter<SettingsState> emit) async {
    // Guardamos los ajustes iniciales y el tema seleccionado en el estado de
    // la aplicación
    emit(state.copyWith(
        theme: event.theme,
        settings: event.settings,
        dataSource: event.dataSource));
  }

  // Establece el tema de la aplicacion
  void _onSetDarkModeEventToState(
      SetDarkModeEvent event, Emitter<SettingsState> emit) async {
    if (event.value) {
      await _pref.setTheme(ThemeModel.dark);
      emit(state.copyWith(theme: ThemeModel.dark));
    } else {
      await _pref.setTheme(ThemeModel.light);
      emit(state.copyWith(theme: ThemeModel.light));
    }
  }
}
