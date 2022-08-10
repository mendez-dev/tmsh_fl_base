import 'dart:convert';

import 'package:base/src/modules/users/models/users_pagination.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'users_pagination_response.g.dart';

abstract class UsersPaginationResponse
    implements Built<UsersPaginationResponse, UsersPaginationResponseBuilder> {
  int get code;
  String get message;
  UsersPagination? get data;

  UsersPaginationResponse._();
  factory UsersPaginationResponse(
          [void Function(UsersPaginationResponseBuilder) updates]) =
      _$UsersPaginationResponse;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(UsersPaginationResponse.serializer, this));
  }

  static UsersPaginationResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(
        UsersPaginationResponse.serializer, json);
  }

  static Serializer<UsersPaginationResponse> get serializer =>
      _$usersPaginationResponseSerializer;
}
