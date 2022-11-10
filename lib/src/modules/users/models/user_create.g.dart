// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserCreate> _$userCreateSerializer = new _$UserCreateSerializer();

class _$UserCreateSerializer implements StructuredSerializer<UserCreate> {
  @override
  final Iterable<Type> types = const [UserCreate, _$UserCreate];
  @override
  final String wireName = 'UserCreate';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserCreate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id_user_group',
      serializers.serialize(object.idUserGroup,
          specifiedType: const FullType(String)),
      'firstname',
      serializers.serialize(object.firstname,
          specifiedType: const FullType(String)),
      'lastname',
      serializers.serialize(object.lastname,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserCreate deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserCreateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id_user_group':
          result.idUserGroup = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstname':
          result.firstname = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'lastname':
          result.lastname = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserCreate extends UserCreate {
  @override
  final String idUserGroup;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String username;
  @override
  final String email;
  @override
  final String? password;

  factory _$UserCreate([void Function(UserCreateBuilder)? updates]) =>
      (new UserCreateBuilder()..update(updates))._build();

  _$UserCreate._(
      {required this.idUserGroup,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        idUserGroup, r'UserCreate', 'idUserGroup');
    BuiltValueNullFieldError.checkNotNull(
        firstname, r'UserCreate', 'firstname');
    BuiltValueNullFieldError.checkNotNull(lastname, r'UserCreate', 'lastname');
    BuiltValueNullFieldError.checkNotNull(username, r'UserCreate', 'username');
    BuiltValueNullFieldError.checkNotNull(email, r'UserCreate', 'email');
  }

  @override
  UserCreate rebuild(void Function(UserCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCreateBuilder toBuilder() => new UserCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCreate &&
        idUserGroup == other.idUserGroup &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        username == other.username &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, idUserGroup.hashCode), firstname.hashCode),
                    lastname.hashCode),
                username.hashCode),
            email.hashCode),
        password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserCreate')
          ..add('idUserGroup', idUserGroup)
          ..add('firstname', firstname)
          ..add('lastname', lastname)
          ..add('username', username)
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class UserCreateBuilder implements Builder<UserCreate, UserCreateBuilder> {
  _$UserCreate? _$v;

  String? _idUserGroup;
  String? get idUserGroup => _$this._idUserGroup;
  set idUserGroup(String? idUserGroup) => _$this._idUserGroup = idUserGroup;

  String? _firstname;
  String? get firstname => _$this._firstname;
  set firstname(String? firstname) => _$this._firstname = firstname;

  String? _lastname;
  String? get lastname => _$this._lastname;
  set lastname(String? lastname) => _$this._lastname = lastname;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  UserCreateBuilder();

  UserCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idUserGroup = $v.idUserGroup;
      _firstname = $v.firstname;
      _lastname = $v.lastname;
      _username = $v.username;
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCreate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserCreate;
  }

  @override
  void update(void Function(UserCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserCreate build() => _build();

  _$UserCreate _build() {
    final _$result = _$v ??
        new _$UserCreate._(
            idUserGroup: BuiltValueNullFieldError.checkNotNull(
                idUserGroup, r'UserCreate', 'idUserGroup'),
            firstname: BuiltValueNullFieldError.checkNotNull(
                firstname, r'UserCreate', 'firstname'),
            lastname: BuiltValueNullFieldError.checkNotNull(
                lastname, r'UserCreate', 'lastname'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'UserCreate', 'username'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'UserCreate', 'email'),
            password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
