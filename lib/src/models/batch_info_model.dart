import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'batch_info_model.g.dart';

abstract class BatchInfoModel
    implements Built<BatchInfoModel, BatchInfoModelBuilder> {
  int get batches;

  BatchInfoModel._();
  factory BatchInfoModel([void Function(BatchInfoModelBuilder) updates]) =
      _$BatchInfoModel;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(BatchInfoModel.serializer, this));
  }

  static BatchInfoModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(BatchInfoModel.serializer, json);
  }

  static Serializer<BatchInfoModel> get serializer =>
      _$batchInfoModelSerializer;
}
