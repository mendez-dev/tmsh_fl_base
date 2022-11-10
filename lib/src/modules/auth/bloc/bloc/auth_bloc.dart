import 'package:base/src/modules/auth/models/auth_response.dart';
import 'package:base/src/modules/auth/repositories/auth_repository.dart';
import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final PreferencesRepository _preferencesRepository;

  AuthBloc(
      {required AuthRepository authRepository,
      required PreferencesRepository preferencesRepository})
      : _authRepository = authRepository,
        _preferencesRepository = preferencesRepository,
        super(AuthState.initial()) {
    on<AuthEvent>((event, emit) {});
    on<ChangePageStateEvent>(_onChangePageStateEventToState);
    on<SetScreenSizeEvent>(_setScreenSizeEventToState);
    on<LoginEvent>(_onLoginEventToState);
  }

  void _onChangePageStateEventToState(
      ChangePageStateEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(pageState: event.pageState));
    if (state.pageState == 1) {
      emit(state.copyWith(
          loginYOffset: 245,
          registerYOffset: state.windowHeight,
          loginXOffset: 0,
          loginWidth: state.windowWidth,
          headingTop: 90));
    } else if (state.pageState == 2) {
      emit(state.copyWith(
          loginYOffset: 225,
          registerYOffset: 245,
          loginXOffset: 20,
          loginWidth: state.windowWidth - 40,
          headingTop: 80));
    }
  }

  void _setScreenSizeEventToState(
      SetScreenSizeEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(
        keyboardHeight: event.keyboardHeight,
        windowWidth: event.windowWidth,
        windowHeight: event.windowHeight,
        loginHeight: event.windowHeight - 245));

    if (state.pageState == 0) {
      emit(state.copyWith(
          loginYOffset: state.windowHeight,
          registerYOffset: event.windowHeight,
          loginWidth: event.windowWidth,
          headingTop: 100));
    }
  }

  _onLoginEventToState(LoginEvent event, Emitter<AuthState> emit) async {
    // Indicamos que se está realizando la peticion
    emit(state.copyWith(isLoadingLogin: true));

    final AuthResponse response = await _authRepository.login(
        username: event.username, password: event.password);

    if (response.code == 200) {
      _preferencesRepository.save<bool>("isLogged", true);
      _preferencesRepository.save("authToken", response.data!.token);
      _preferencesRepository.save("initial_route", 'home');

      emit(state.copyWith(isLoginSuccess: true));
      emit(state.copyWith(isLoginSuccess: false));
    }

    emit(state.copyWith(isLoadingLogin: false));
  }
}
