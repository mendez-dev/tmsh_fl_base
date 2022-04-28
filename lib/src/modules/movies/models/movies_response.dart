import 'dart:convert';

import 'package:base/src/modules/movies/models/movie_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializer.dart';

part 'movies_response.g.dart';

abstract class MoviesResponse implements Built<MoviesResponse, MoviesResponseBuilder> {
  
  int get page;
  BuiltList<MovieModel> get results;
  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  MoviesResponse._();
  factory MoviesResponse([void Function(MoviesResponseBuilder) updates]) = _$MoviesResponse;

  String toJson() {
    return jsonEncode(serializers.serializeWith(MoviesResponse.serializer, this));
  }

  static MoviesResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MoviesResponse.serializer, json);
  }

  static Serializer<MoviesResponse> get serializer => _$moviesResponseSerializer;
}