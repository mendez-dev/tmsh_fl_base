part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final int pageState;
  final double loginYOffset;
  final double loginXOffset;
  final double loginWidth;
  final double loginHeight;
  final double registerYOffset;
  final double windowWidth;
  final double windowHeight;
  final double headingTop;
  final double keyboardHeight;

  const AuthState(
      {required this.pageState,
      required this.loginYOffset,
      required this.loginXOffset,
      required this.loginWidth,
      required this.loginHeight,
      required this.registerYOffset,
      required this.windowWidth,
      required this.windowHeight,
      required this.headingTop,
      required this.keyboardHeight});

  factory AuthState.initial() {
    return const AuthState(
        pageState: 0,
        loginYOffset: 0,
        loginXOffset: 0,
        loginWidth: 0,
        loginHeight: 0,
        registerYOffset: 0,
        windowWidth: 0,
        windowHeight: 0.0,
        headingTop: 100,
        keyboardHeight: 0.0);
  }

  AuthState copyWith(
      {int? pageState,
      double? loginYOffset,
      double? loginXOffset,
      double? loginWidth,
      double? loginHeight,
      double? registerYOffset,
      double? windowWidth,
      double? windowHeight,
      double? headingTop,
      double? keyboardHeight}) {
    return AuthState(
        pageState: pageState ?? this.pageState,
        loginYOffset: loginYOffset ?? this.loginYOffset,
        loginXOffset: loginXOffset ?? this.loginXOffset,
        loginWidth: loginWidth ?? this.loginWidth,
        loginHeight: loginHeight ?? this.loginHeight,
        registerYOffset: registerYOffset ?? this.registerYOffset,
        windowWidth: windowWidth ?? this.windowWidth,
        windowHeight: windowHeight ?? this.windowHeight,
        headingTop: headingTop ?? this.headingTop,
        keyboardHeight: keyboardHeight ?? this.keyboardHeight);
  }

  @override
  List<Object> get props => [
        pageState,
        loginYOffset,
        loginXOffset,
        loginWidth,
        registerYOffset,
        windowWidth,
        windowHeight,
        headingTop,
        loginHeight,
        keyboardHeight
      ];
}
