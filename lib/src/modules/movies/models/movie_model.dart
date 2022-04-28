import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializer.dart';

part 'movie_model.g.dart';

abstract class MovieModel implements Built<MovieModel, MovieModelBuilder> {
  
  int get id;
  @BuiltValueField(wireName: 'original_language')
	String get originalLanguage;
  @BuiltValueField(wireName: 'original_title')
	String get originalTitle;
	String get overview;
	double get popularity;
  @BuiltValueField(wireName: 'poster_path')
	String? get posterPath;
  @BuiltValueField(wireName: 'release_date')
	String get releaseDate;
	String get title;
	@BuiltValueField(wireName: 'vote_average')
	double get voteAverage;

  MovieModel._();
  factory MovieModel([void Function(MovieModelBuilder) updates]) = _$MovieModel;

  String toJson() {
    return jsonEncode(serializers.serializeWith(MovieModel.serializer, this));
  }

  static MovieModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MovieModel.serializer, json);
  }

  static Serializer<MovieModel> get serializer => _$movieModelSerializer;
}