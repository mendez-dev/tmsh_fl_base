import 'package:base/src/modules/movies/models/movies_response.dart';

abstract class MoviesRepository{

  Future<MoviesResponse?> getNowPlaying({int page = 1});
  
}