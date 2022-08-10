import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  // "id_user": "ffe42718-0dea-11ed-b8e4-a029190c1da2",
  // "id_legacy": null,
  // "id_user_group": "fffd39a3-0dea-11ed-b8e4-a029190c1da2",
  // "firstname": "ADMIN",
  // "lastname": "ADMIN",
  // "username": "ADMIN",
  // "email": "admin@admin.com",
  // "picture": "",
  // "is_active": true,
  // "created_by": "ffe42718-0dea-11ed-b8e4-a029190c1da2",
  // "created_at": "2022-07-27 14:30:48",
  // "updated_by": "ffe42718-0dea-11ed-b8e4-a029190c1da2",
  // "updated_at": "2022-07-27 14:30:48",
  // "deleted_by": null,
  // "deleted_at": null

  @BuiltValueField(wireName: 'id_user')
  String get idUser;
  @BuiltValueField(wireName: 'id_user_group')
  String get idUserGroup;
  String get firstname;
  String get lastname;
  String get username;
  String get email;
  String? get picture;
  @BuiltValueField(wireName: 'is_active')
  bool get isActive;
  @BuiltValueField(wireName: 'created_by')
  String get createdBy;
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;
  @BuiltValueField(wireName: 'updated_by')
  String get updatedBy;
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;
  @BuiltValueField(wireName: 'deleted_by')
  String? get deletedBy;
  @BuiltValueField(wireName: 'deleted_at')
  String? get deletedAt;

  UserModel._();
  factory UserModel([void Function(UserModelBuilder) updates]) = _$UserModel;

  String toJson() {
    return jsonEncode(serializers.serializeWith(UserModel.serializer, this));
  }

  static UserModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserModel.serializer, json);
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
