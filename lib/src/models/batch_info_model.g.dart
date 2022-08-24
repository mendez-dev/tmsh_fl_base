// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_info_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BatchInfoModel> _$batchInfoModelSerializer =
    new _$BatchInfoModelSerializer();

class _$BatchInfoModelSerializer
    implements StructuredSerializer<BatchInfoModel> {
  @override
  final Iterable<Type> types = const [BatchInfoModel, _$BatchInfoModel];
  @override
  final String wireName = 'BatchInfoModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, BatchInfoModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'batches',
      serializers.serialize(object.batches, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  BatchInfoModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BatchInfoModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'batches':
          result.batches = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BatchInfoModel extends BatchInfoModel {
  @override
  final int batches;

  factory _$BatchInfoModel([void Function(BatchInfoModelBuilder)? updates]) =>
      (new BatchInfoModelBuilder()..update(updates))._build();

  _$BatchInfoModel._({required this.batches}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        batches, r'BatchInfoModel', 'batches');
  }

  @override
  BatchInfoModel rebuild(void Function(BatchInfoModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BatchInfoModelBuilder toBuilder() =>
      new BatchInfoModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BatchInfoModel && batches == other.batches;
  }

  @override
  int get hashCode {
    return $jf($jc(0, batches.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BatchInfoModel')
          ..add('batches', batches))
        .toString();
  }
}

class BatchInfoModelBuilder
    implements Builder<BatchInfoModel, BatchInfoModelBuilder> {
  _$BatchInfoModel? _$v;

  int? _batches;
  int? get batches => _$this._batches;
  set batches(int? batches) => _$this._batches = batches;

  BatchInfoModelBuilder();

  BatchInfoModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _batches = $v.batches;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BatchInfoModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BatchInfoModel;
  }

  @override
  void update(void Function(BatchInfoModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BatchInfoModel build() => _build();

  _$BatchInfoModel _build() {
    final _$result = _$v ??
        new _$BatchInfoModel._(
            batches: BuiltValueNullFieldError.checkNotNull(
                batches, r'BatchInfoModel', 'batches'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
