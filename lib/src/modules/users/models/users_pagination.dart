import 'dart:convert';

import 'package:base/src/models/pagination_model.dart';
import 'package:base/src/modules/users/models/user_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'users_pagination.g.dart';

abstract class UsersPagination
    implements
        Built<UsersPagination, UsersPaginationBuilder>,
        PaginationModel<UserModel> {
  @override
  BuiltList<UserModel> get data;
  @override
  @BuiltValueField(wireName: 'current_page')
  int get currentPage;
  @override
  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  UsersPagination._();
  factory UsersPagination([void Function(UsersPaginationBuilder) updates]) =
      _$UsersPagination;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(UsersPagination.serializer, this));
  }

  static UsersPagination? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UsersPagination.serializer, json);
  }

  static Serializer<UsersPagination> get serializer =>
      _$usersPaginationSerializer;
}
