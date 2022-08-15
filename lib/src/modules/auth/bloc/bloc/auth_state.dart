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
  final bool isLoadingLogin;
  final bool isLoginSuccess;

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
      required this.keyboardHeight,
      required this.isLoadingLogin,
      required this.isLoginSuccess});

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
        keyboardHeight: 0.0,
        isLoadingLogin: false,
        isLoginSuccess: false);
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
      double? keyboardHeight,
      bool? isLoadingLogin,
      bool? isLoginSuccess}) {
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
        keyboardHeight: keyboardHeight ?? this.keyboardHeight,
        isLoadingLogin: isLoadingLogin ?? this.isLoadingLogin,
        isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess);
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
        keyboardHeight,
        isLoadingLogin,
        isLoginSuccess
      ];
}
