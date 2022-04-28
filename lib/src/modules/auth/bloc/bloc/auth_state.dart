part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool loading;
  final int pageState;
  final double loginYOffset;
  final double loginXOffset;
  final double loginWidth;
  final double loginHeight;
  final double registerYOffset;
  final double windowWidth;
  final double windowHeight;
  final double headingTop;
  final bool onSuccess;
  final bool onError;
  final String message;
  final int loggedStatus; // 0: unverified // 1 - no auth // 2 auth

  const AuthState(
      {required this.loading,
      required this.pageState,
      required this.loginYOffset,
      required this.loginXOffset,
      required this.loginWidth,
      required this.loginHeight,
      required this.registerYOffset,
      required this.windowWidth,
      required this.windowHeight,
      required this.headingTop,
      required this.onSuccess,
      required this.onError,
      required this.message,
      required this.loggedStatus});

  factory AuthState.initial() {
    return const AuthState(
        loading: false,
        pageState: 0,
        loginYOffset: double.infinity,
        loginXOffset: 0,
        loginWidth: 0,
        loginHeight: 0,
        registerYOffset: double.infinity,
        windowWidth: 0,
        windowHeight: 0.0,
        headingTop: 100,
        onError: false,
        onSuccess: false,
        message: '',
        loggedStatus: 0);
  }

  AuthState copyWith(
      {bool? loading,
      int? pageState,
      double? loginYOffset,
      double? loginXOffset,
      double? loginWidth,
      double? loginHeight,
      double? registerYOffset,
      double? windowWidth,
      double? windowHeight,
      double? headingTop,
      bool? onError,
      bool? onSuccess,
      String? message,
      int? loggedStatus}) {
    return AuthState(
        loading: loading ?? this.loading,
        pageState: pageState ?? this.pageState,
        loginYOffset: loginYOffset ?? this.loginYOffset,
        loginXOffset: loginXOffset ?? this.loginXOffset,
        loginWidth: loginWidth ?? this.loginWidth,
        loginHeight: loginHeight ?? this.loginHeight,
        registerYOffset: registerYOffset ?? this.registerYOffset,
        windowWidth: windowWidth ?? this.windowWidth,
        windowHeight: windowHeight ?? this.windowHeight,
        headingTop: headingTop ?? this.headingTop,
        onError: onError ?? this.onError,
        onSuccess: onSuccess ?? this.onSuccess,
        message: message ?? this.message,
        loggedStatus: loggedStatus ?? this.loggedStatus);
  }

  @override
  List<Object> get props => [
        loading,
        pageState,
        loginYOffset,
        loginXOffset,
        loginWidth,
        registerYOffset,
        windowWidth,
        windowHeight,
        headingTop,
        loginHeight,
        onError,
        onSuccess,
        message,
        loggedStatus
      ];
}
