// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserResponse> _$userResponseSerializer =
    new _$UserResponseSerializer();

class _$UserResponseSerializer implements StructuredSerializer<UserResponse> {
  @override
  final Iterable<Type> types = const [UserResponse, _$UserResponse];
  @override
  final String wireName = 'UserResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserModel)));
    }
    value = object.errors;
    if (value != null) {
      result
        ..add('errors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  UserResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
        case 'errors':
          result.errors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserResponse extends UserResponse {
  @override
  final bool success;
  @override
  final UserModel? data;
  @override
  final BuiltList<String>? errors;

  factory _$UserResponse([void Function(UserResponseBuilder)? updates]) =>
      (new UserResponseBuilder()..update(updates))._build();

  _$UserResponse._({required this.success, this.data, this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'UserResponse', 'success');
  }

  @override
  UserResponse rebuild(void Function(UserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserResponseBuilder toBuilder() => new UserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserResponse &&
        success == other.success &&
        data == other.data &&
        errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, success.hashCode), data.hashCode), errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserResponse')
          ..add('success', success)
          ..add('data', data)
          ..add('errors', errors))
        .toString();
  }
}

class UserResponseBuilder
    implements Builder<UserResponse, UserResponseBuilder> {
  _$UserResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UserModelBuilder? _data;
  UserModelBuilder get data => _$this._data ??= new UserModelBuilder();
  set data(UserModelBuilder? data) => _$this._data = data;

  ListBuilder<String>? _errors;
  ListBuilder<String> get errors =>
      _$this._errors ??= new ListBuilder<String>();
  set errors(ListBuilder<String>? errors) => _$this._errors = errors;

  UserResponseBuilder();

  UserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _data = $v.data?.toBuilder();
      _errors = $v.errors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserResponse;
  }

  @override
  void update(void Function(UserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserResponse build() => _build();

  _$UserResponse _build() {
    _$UserResponse _$result;
    try {
      _$result = _$v ??
          new _$UserResponse._(
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'UserResponse', 'success'),
              data: _data?.build(),
              errors: _errors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'errors';
        _errors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
