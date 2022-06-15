import 'package:base/src/modules/auth/models/auth_model.dart';
import 'package:base/src/modules/auth/models/auth_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializer.g.dart';

@SerializersFor([AuthModel, AuthResponse])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
