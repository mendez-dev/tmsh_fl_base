import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'auth_model.g.dart';

abstract class AuthModel implements Built<AuthModel, AuthModelBuilder> {
  String get token;
  BuiltList<String>? get errors;

  AuthModel._();
  factory AuthModel([void Function(AuthModelBuilder) updates]) = _$AuthModel;

  String toJson() {
    return jsonEncode(serializers.serializeWith(AuthModel.serializer, this));
  }

  static AuthModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthModel.serializer, json);
  }

  static Serializer<AuthModel> get serializer => _$authModelSerializer;
}
