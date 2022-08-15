// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_time_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DateTimeModel> _$dateTimeModelSerializer =
    new _$DateTimeModelSerializer();

class _$DateTimeModelSerializer implements StructuredSerializer<DateTimeModel> {
  @override
  final Iterable<Type> types = const [DateTimeModel, _$DateTimeModel];
  @override
  final String wireName = 'DateTimeModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, DateTimeModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.timezoneType;
    if (value != null) {
      result
        ..add('timezone_type')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.timezone;
    if (value != null) {
      result
        ..add('timezone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DateTimeModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DateTimeModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'timezone_type':
          result.timezoneType = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'timezone':
          result.timezone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DateTimeModel extends DateTimeModel {
  @override
  final String date;
  @override
  final int? timezoneType;
  @override
  final String? timezone;

  factory _$DateTimeModel([void Function(DateTimeModelBuilder)? updates]) =>
      (new DateTimeModelBuilder()..update(updates))._build();

  _$DateTimeModel._({required this.date, this.timezoneType, this.timezone})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(date, r'DateTimeModel', 'date');
  }

  @override
  DateTimeModel rebuild(void Function(DateTimeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DateTimeModelBuilder toBuilder() => new DateTimeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateTimeModel &&
        date == other.date &&
        timezoneType == other.timezoneType &&
        timezone == other.timezone;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, date.hashCode), timezoneType.hashCode), timezone.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DateTimeModel')
          ..add('date', date)
          ..add('timezoneType', timezoneType)
          ..add('timezone', timezone))
        .toString();
  }
}

class DateTimeModelBuilder
    implements Builder<DateTimeModel, DateTimeModelBuilder> {
  _$DateTimeModel? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  int? _timezoneType;
  int? get timezoneType => _$this._timezoneType;
  set timezoneType(int? timezoneType) => _$this._timezoneType = timezoneType;

  String? _timezone;
  String? get timezone => _$this._timezone;
  set timezone(String? timezone) => _$this._timezone = timezone;

  DateTimeModelBuilder();

  DateTimeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _timezoneType = $v.timezoneType;
      _timezone = $v.timezone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateTimeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DateTimeModel;
  }

  @override
  void update(void Function(DateTimeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DateTimeModel build() => _build();

  _$DateTimeModel _build() {
    final _$result = _$v ??
        new _$DateTimeModel._(
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'DateTimeModel', 'date'),
            timezoneType: timezoneType,
            timezone: timezone);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
