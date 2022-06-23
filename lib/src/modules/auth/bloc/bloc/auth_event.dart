part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class ChangePageStateEvent implements AuthEvent {
  final int pageState;

  ChangePageStateEvent(this.pageState);

  @override
  List<Object> get props => [pageState];

  @override
  bool? get stringify => true;
}

class SetScreenSizeEvent implements AuthEvent {
  final double windowWidth;
  final double windowHeight;
  final double keyboardHeight;

  SetScreenSizeEvent(
      {required this.windowWidth,
      required this.windowHeight,
      required this.keyboardHeight});

  @override
  List<Object> get props => [windowHeight, windowWidth, keyboardHeight];

  @override
  bool? get stringify => true;
}

class LoginEvent implements AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];

  @override
  bool? get stringify => throw UnimplementedError();
}
