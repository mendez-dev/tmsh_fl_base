// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthResponse> _$authResponseSerializer =
    new _$AuthResponseSerializer();

class _$AuthResponseSerializer implements StructuredSerializer<AuthResponse> {
  @override
  final Iterable<Type> types = const [AuthResponse, _$AuthResponse];
  @override
  final String wireName = 'AuthResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthResponse object,
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
            specifiedType: const FullType(AuthModel)));
    }
    return result;
  }

  @override
  AuthResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthResponseBuilder();

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
              specifiedType: const FullType(AuthModel))! as AuthModel);
          break;
      }
    }

    return result.build();
  }
}

class _$AuthResponse extends AuthResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final AuthModel? data;

  factory _$AuthResponse([void Function(AuthResponseBuilder)? updates]) =>
      (new AuthResponseBuilder()..update(updates))._build();

  _$AuthResponse._({required this.code, required this.message, this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'AuthResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(message, r'AuthResponse', 'message');
  }

  @override
  AuthResponse rebuild(void Function(AuthResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthResponseBuilder toBuilder() => new AuthResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthResponse &&
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
    return (newBuiltValueToStringHelper(r'AuthResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class AuthResponseBuilder
    implements Builder<AuthResponse, AuthResponseBuilder> {
  _$AuthResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AuthModelBuilder? _data;
  AuthModelBuilder get data => _$this._data ??= new AuthModelBuilder();
  set data(AuthModelBuilder? data) => _$this._data = data;

  AuthResponseBuilder();

  AuthResponseBuilder get _$this {
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
  void replace(AuthResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthResponse;
  }

  @override
  void update(void Function(AuthResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthResponse build() => _build();

  _$AuthResponse _build() {
    _$AuthResponse _$result;
    try {
      _$result = _$v ??
          new _$AuthResponse._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'AuthResponse', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'AuthResponse', 'message'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
