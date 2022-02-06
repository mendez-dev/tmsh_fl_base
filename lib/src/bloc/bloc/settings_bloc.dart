import 'package:base/src/models/settings_model.dart';
import 'package:base/src/models/theme_model.dart';
import 'package:base/src/repositories/preferences/preferences_repository.dart';
import 'package:base/src/repositories/settings/settings_repository.dart';
import 'package:base/src/utils/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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
  }

  // Actualiza el estado del bloc al ejecutar el evento GetInitialConfigEvent
  void _onGetInitialConfigEventToState(
      GetInitialConfigEvent event, Emitter<SettingsState> emit) async {
    // Guardamos los ajustes iniciales y el tema seleccionado en el estado de
    // la aplicación
    emit(state.copyWith(theme: event.theme, settings: event.settings));
  }
}
