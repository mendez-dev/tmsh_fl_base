import 'dart:convert';

import 'package:base/src/modules/users/models/user_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'user_response.g.dart';

abstract class UserResponse
    implements Built<UserResponse, UserResponseBuilder> {
  int get code;
  String get message;
  UserModel? get data;
  BuiltList<String>? get errors;

  UserResponse._();
  factory UserResponse([void Function(UserResponseBuilder) updates]) =
      _$UserResponse;

  String toJson() {
    return jsonEncode(serializers.serializeWith(UserResponse.serializer, this));
  }

  static UserResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserResponse.serializer, json);
  }

  static Serializer<UserResponse> get serializer => _$userResponseSerializer;
}
