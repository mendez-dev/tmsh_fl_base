import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'user_create.g.dart';

abstract class UserCreate implements Built<UserCreate, UserCreateBuilder> {
  @BuiltValueField(wireName: 'id_user_group')
  String get idUserGroup;
  String get firstname;
  String get lastname;
  String get username;
  String get email;
  String? get password;

  UserCreate._();
  factory UserCreate([void Function(UserCreateBuilder) updates]) = _$UserCreate;

  String toJson() {
    return jsonEncode(serializers.serializeWith(UserCreate.serializer, this));
  }

  static UserCreate? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserCreate.serializer, json);
  }

  static Serializer<UserCreate> get serializer => _$userCreateSerializer;
}
