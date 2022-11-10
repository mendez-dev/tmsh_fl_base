import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'date_time_model.g.dart';

abstract class DateTimeModel
    implements Built<DateTimeModel, DateTimeModelBuilder> {
  String get date;
  @BuiltValueField(wireName: 'timezone_type')
  int? get timezoneType;
  String? get timezone;

  DateTimeModel._();
  factory DateTimeModel([void Function(DateTimeModelBuilder) updates]) =
      _$DateTimeModel;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(DateTimeModel.serializer, this));
  }

  static DateTimeModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DateTimeModel.serializer, json);
  }

  static Serializer<DateTimeModel> get serializer => _$dateTimeModelSerializer;
}
