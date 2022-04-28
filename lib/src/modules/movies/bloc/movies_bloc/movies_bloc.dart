import 'package:base/src/modules/movies/models/movie_model.dart';
import 'package:base/src/modules/movies/models/movies_response.dart';
import 'package:base/src/modules/movies/repositories/movies_repository/movies_repository.dart';
import 'package:base/src/utils/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesBloc({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository,
        super(MoviesState.initial()) {
    on<MoviesEvent>((event, emit) {});
    on<GetMoviesEvent>(_getMoviesEvent);
    on<RefreshMoviesEvent>(_refreshMoviesEvent);
    on<LoadMoreMoviesEvent>(_loadMoreMoviesEvent);
  }

  void _getMoviesEvent(GetMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(loading: true));

    try {
      MoviesResponse? response = await _moviesRepository.getNowPlaying();

      if (response != null) {
        emit(state.copyWith(
            movies: response.results,
            page: response.page,
            totalPage: response.totalPages,
            refreshStatus: RefreshStatus.canRefresh));
      }
    } catch (error) {
      logger.e(error);
    }

    emit(state.copyWith(
        loading: false, refreshStatus: RefreshStatus.canRefresh));
  }

  void _refreshMoviesEvent(
      RefreshMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(refreshStatus: RefreshStatus.refreshing));

    try {
      MoviesResponse? response = await _moviesRepository.getNowPlaying();

      if (response != null) {
        emit(state.copyWith(
            movies: response.results,
            page: response.page,
            totalPage: response.totalPages,
            refreshStatus: RefreshStatus.canRefresh));
      }
    } catch (error) {
      logger.e(error);
    }

    emit(state.copyWith(
        loading: false, refreshStatus: RefreshStatus.canRefresh));
  }

  void _loadMoreMoviesEvent(
      LoadMoreMoviesEvent event, Emitter<MoviesState> emit) async {
    if (state.page + 1 <= state.totalPage) {
      emit(state.copyWith(refreshStatus: RefreshStatus.refreshing));

      try {
        MoviesResponse? response = await _moviesRepository.getNowPlaying(page: state.page + 1);

        if (response != null) {
          logger.v(response);

          BuiltList<MovieModel> movies = joinBuiltList<MovieModel>(state.movies, response.results);
          emit(state.copyWith(
              movies: movies,
              page: response.page,
              totalPage: response.totalPages,
              refreshStatus: RefreshStatus.canRefresh));
        }
      } catch (error) {
        logger.e(error);
      }

      emit(state.copyWith(
          loading: false, refreshStatus: RefreshStatus.canRefresh));
    } else {
      emit(state.copyWith(
          loading: false, refreshStatus: RefreshStatus.completed));
    }
  }
}

BuiltList<T> joinBuiltList<T>(BuiltList<T> start, BuiltList<T> end) {
  final BuiltList<T> list = start.rebuild((c) => c.addAll(end));
  return list;
}
