part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final bool loading;
  final int page;
  final int totalPage;
  final BuiltList<MovieModel> movies;
   final RefreshStatus refreshStatus;

  const MoviesState(
      {required this.loading,
      required this.page,
      required this.totalPage,
      required this.movies,
      required this.refreshStatus
      });

  factory MoviesState.initial() {
    return  MoviesState(
        loading: false,
        page: 0,
        totalPage: 0,
        movies: BuiltList<MovieModel>(),
        refreshStatus: RefreshStatus.canRefresh
        );
  }

  MoviesState copyWith(
      {bool? loading,
      int? page,
      int? totalPage,
      BuiltList<MovieModel>? movies,
      RefreshStatus? refreshStatus}) {
    return MoviesState(
        loading: loading ?? this.loading,
        page: page ?? this.page,
        totalPage: totalPage ?? this.totalPage,
        movies: movies ?? this.movies,
        refreshStatus: refreshStatus ?? this.refreshStatus);
  }

  @override
  List<Object> get props => [
        loading,
        page,
        totalPage,
        movies,
        refreshStatus
      ];
}
