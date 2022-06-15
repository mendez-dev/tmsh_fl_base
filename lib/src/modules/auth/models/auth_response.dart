import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';
import 'auth_model.dart';

part 'auth_response.g.dart';

abstract class AuthResponse
    implements Built<AuthResponse, AuthResponseBuilder> {
  int get code;
  String get message;
  AuthModel? get auth;

  AuthResponse._();
  factory AuthResponse([void Function(AuthResponseBuilder) updates]) =
      _$AuthResponse;

  String toJson() {
    return jsonEncode(serializers.serializeWith(AuthResponse.serializer, this));
  }

  static AuthResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthResponse.serializer, json);
  }

  static Serializer<AuthResponse> get serializer => _$authResponseSerializer;
}
