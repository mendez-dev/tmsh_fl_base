import 'package:base/src/modules/movies/models/movie_model.dart';
import 'package:base/src/modules/movies/models/movies_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializer.g.dart';

@SerializersFor([MovieModel, MoviesResponse])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();