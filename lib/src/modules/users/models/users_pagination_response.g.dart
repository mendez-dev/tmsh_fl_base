// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_pagination_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersPaginationResponse> _$usersPaginationResponseSerializer =
    new _$UsersPaginationResponseSerializer();

class _$UsersPaginationResponseSerializer
    implements StructuredSerializer<UsersPaginationResponse> {
  @override
  final Iterable<Type> types = const [
    UsersPaginationResponse,
    _$UsersPaginationResponse
  ];
  @override
  final String wireName = 'UsersPaginationResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UsersPaginationResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UsersPagination)));
    }
    return result;
  }

  @override
  UsersPaginationResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersPaginationResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(UsersPagination))!
              as UsersPagination);
          break;
      }
    }

    return result.build();
  }
}

class _$UsersPaginationResponse extends UsersPaginationResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final UsersPagination? data;

  factory _$UsersPaginationResponse(
          [void Function(UsersPaginationResponseBuilder)? updates]) =>
      (new UsersPaginationResponseBuilder()..update(updates))._build();

  _$UsersPaginationResponse._(
      {required this.code, required this.message, this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'UsersPaginationResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(
        message, r'UsersPaginationResponse', 'message');
  }

  @override
  UsersPaginationResponse rebuild(
          void Function(UsersPaginationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersPaginationResponseBuilder toBuilder() =>
      new UsersPaginationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersPaginationResponse &&
        code == other.code &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, code.hashCode), message.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersPaginationResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class UsersPaginationResponseBuilder
    implements
        Builder<UsersPaginationResponse, UsersPaginationResponseBuilder> {
  _$UsersPaginationResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  UsersPaginationBuilder? _data;
  UsersPaginationBuilder get data =>
      _$this._data ??= new UsersPaginationBuilder();
  set data(UsersPaginationBuilder? data) => _$this._data = data;

  UsersPaginationResponseBuilder();

  UsersPaginationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersPaginationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersPaginationResponse;
  }

  @override
  void update(void Function(UsersPaginationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersPaginationResponse build() => _build();

  _$UsersPaginationResponse _build() {
    _$UsersPaginationResponse _$result;
    try {
      _$result = _$v ??
          new _$UsersPaginationResponse._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'UsersPaginationResponse', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'UsersPaginationResponse', 'message'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersPaginationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
