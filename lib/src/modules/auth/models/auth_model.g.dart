// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthModel> _$authModelSerializer = new _$AuthModelSerializer();

class _$AuthModelSerializer implements StructuredSerializer<AuthModel> {
  @override
  final Iterable<Type> types = const [AuthModel, _$AuthModel];
  @override
  final String wireName = 'AuthModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];
    Object? value;
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
  AuthModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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

class _$AuthModel extends AuthModel {
  @override
  final String token;
  @override
  final BuiltList<String>? errors;

  factory _$AuthModel([void Function(AuthModelBuilder)? updates]) =>
      (new AuthModelBuilder()..update(updates))._build();

  _$AuthModel._({required this.token, this.errors}) : super._() {
    BuiltValueNullFieldError.checkNotNull(token, r'AuthModel', 'token');
  }

  @override
  AuthModel rebuild(void Function(AuthModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthModelBuilder toBuilder() => new AuthModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthModel && token == other.token && errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, token.hashCode), errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthModel')
          ..add('token', token)
          ..add('errors', errors))
        .toString();
  }
}

class AuthModelBuilder implements Builder<AuthModel, AuthModelBuilder> {
  _$AuthModel? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  ListBuilder<String>? _errors;
  ListBuilder<String> get errors =>
      _$this._errors ??= new ListBuilder<String>();
  set errors(ListBuilder<String>? errors) => _$this._errors = errors;

  AuthModelBuilder();

  AuthModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _errors = $v.errors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthModel;
  }

  @override
  void update(void Function(AuthModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthModel build() => _build();

  _$AuthModel _build() {
    _$AuthModel _$result;
    try {
      _$result = _$v ??
          new _$AuthModel._(
              token: BuiltValueNullFieldError.checkNotNull(
                  token, r'AuthModel', 'token'),
              errors: _errors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        _errors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
