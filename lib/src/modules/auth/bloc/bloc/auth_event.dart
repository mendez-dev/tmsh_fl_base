part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class ChangePageStateEvent implements AuthEvent{

  final int pageState;

  ChangePageStateEvent(this.pageState);

  @override
  List<Object> get props => [pageState];

  @override
  bool? get stringify => true;

}

class SetScreenSizeEvent implements AuthEvent{

  final double windowWidth;
  final double windowHeight;

  SetScreenSizeEvent({required this.windowWidth, required this.windowHeight});


  @override
  List<Object> get props => throw UnimplementedError();

  @override
  bool? get stringify => true;

}
