import 'package:base/src/modules/auth/repositories/auth/auth_repository.dart';
import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'package:base/src/utils/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PreferencesRepository _preferencesRepository;
  final AuthRepository _authRepository;

  AuthBloc(
      {required PreferencesRepository preferencesRepository,
      required AuthRepository authRepository})
      : _preferencesRepository = preferencesRepository,
        _authRepository = authRepository,
        super(AuthState.initial()) {
    on<AuthEvent>((event, emit) {});
    on<ChangePageStateEvent>(_onChangePageStateEventToState);
    on<SetScreenSizeEvent>(_setScreenSizeEventToState);
    on<VerifyTokenEvent>(_verifyTokenEvent);
    on<LoginEvent>(_loginEvent);
  }

  void _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    // indicate that the request is being made with a loading
    emit(state.copyWith(loading: true));

    try {
      String? token = await _authRepository.login(
          email: event.email, password: event.password);

      if (token != null) {
        // Save token in local storage
        _preferencesRepository.saveAuthToken(token);

        emit(state.copyWith(onSuccess: true));
        emit(AuthState.initial());
      } else {
        emit(state.copyWith(
            onError: true, message: "Incorrect access credentials"));
      }
    } on DioError catch (e) {
      logger.v(e.response!.data['error']);

      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          emit(state.copyWith(onError: true, message: e.response!.data['error']));
        } else {
          emit(state.copyWith(onError: true, message: "Error trying to login"));
        }
      } else {
        emit(state.copyWith(onError: true, message: "Internal server error"));
      }
    }

    emit(state.copyWith(loading: false, onError: false, onSuccess: false));
  }

  void _verifyTokenEvent(
      VerifyTokenEvent event, Emitter<AuthState> emit) async {
    // add 2 seconds delay to show animation splash screen
    await Future.delayed(const Duration(milliseconds: 2000));
    // Load toke from local storage
    String? token = await _preferencesRepository.getAuthToken();

    logger.i(token);

    if (token != null) {
      emit(state.copyWith(loggedStatus: 2));
    } else {
      emit(state.copyWith(loggedStatus: 1));
    }
  }

  void _onChangePageStateEventToState(
      ChangePageStateEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(pageState: event.pageState));
    if (state.pageState == 1) {
      emit(state.copyWith(
          loginYOffset: 270,
          registerYOffset: state.windowHeight,
          loginXOffset: 0,
          loginWidth: state.windowWidth,
          headingTop: 90));
    } else if (state.pageState == 2) {
      emit(state.copyWith(
          loginYOffset: 240,
          registerYOffset: 270,
          loginXOffset: 20,
          loginWidth: state.windowWidth - 40,
          headingTop: 80));
    }
  }

  void _setScreenSizeEventToState(
      SetScreenSizeEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(
        windowWidth: event.windowWidth,
        windowHeight: event.windowHeight,
        loginHeight: event.windowHeight - 270));

    if (state.pageState == 0) {
      emit(state.copyWith(
          loginYOffset: state.windowHeight,
          registerYOffset: event.windowHeight,
          loginWidth: event.windowWidth,
          headingTop: 100));
    }
  }
}
