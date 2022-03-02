import 'dart:convert';

import 'serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'settings_model.g.dart';

/// Contiene los ajustes y configuraciones globales de la aplicación
abstract class SettingsModel
    implements Built<SettingsModel, SettingsModelBuilder> {
  @BuiltValueField(wireName: 'app_name')
  String get appName;

  @BuiltValueField(wireName: 'defaultTax')
  double get defaultTax;

  @BuiltValueField(wireName: 'defaultCurrency')
  String get defaultCurrency;

  @BuiltValueField(wireName: 'main_color')
  String get mainColor;

  @BuiltValueField(wireName: 'main_dark_color')
  String get mainDarkColor;

  @BuiltValueField(wireName: 'second_color')
  String get secondColor;

  @BuiltValueField(wireName: 'second_dark_color')
  String get secondDarkColor;

  @BuiltValueField(wireName: 'accent_color')
  String get accentColor;

  @BuiltValueField(wireName: 'accent_dark_color')
  String get accentDarkColor;

  @BuiltValueField(wireName: 'scaffold_dark_color')
  String get scaffoldDarkColor;

  @BuiltValueField(wireName: 'scaffold_color')
  String get scaffoldColor;

  SettingsModel._();
  factory SettingsModel([void Function(SettingsModelBuilder) updates]) =
      _$SettingsModel;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(SettingsModel.serializer, this));
  }

  static SettingsModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SettingsModel.serializer, json);
  }

  static Serializer<SettingsModel> get serializer => _$settingsModelSerializer;
}

/// Respuesta HTTP de Settings Model
abstract class SettingsResponse
    implements Built<SettingsResponse, SettingsResponseBuilder> {
  int get code;
  String get message;
  SettingsModel? get data;

  SettingsResponse._();
  factory SettingsResponse([void Function(SettingsResponseBuilder) updates]) =
      _$SettingsResponse;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(SettingsResponse.serializer, this));
  }

  static SettingsResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SettingsResponse.serializer, json);
  }

  static Serializer<SettingsResponse> get serializer =>
      _$settingsResponseSerializer;
}
