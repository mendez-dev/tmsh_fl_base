part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesEvent implements MoviesEvent{
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

}

class RefreshMoviesEvent implements MoviesEvent{
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

}

class LoadMoreMoviesEvent implements MoviesEvent{
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;

}