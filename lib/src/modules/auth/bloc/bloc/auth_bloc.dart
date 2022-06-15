import 'package:base/src/modules/auth/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState.initial()) {
    on<AuthEvent>((event, emit) {});
    on<ChangePageStateEvent>(_onChangePageStateEventToState);
    on<SetScreenSizeEvent>(_setScreenSizeEventToState);
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
}
