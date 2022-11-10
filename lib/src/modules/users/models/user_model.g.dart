// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserModel> _$userModelSerializer = new _$UserModelSerializer();

class _$UserModelSerializer implements StructuredSerializer<UserModel> {
  @override
  final Iterable<Type> types = const [UserModel, _$UserModel];
  @override
  final String wireName = 'UserModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id_user',
      serializers.serialize(object.idUser,
          specifiedType: const FullType(String)),
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
      'is_active',
      serializers.serialize(object.isActive,
          specifiedType: const FullType(int)),
      'created_by',
      serializers.serialize(object.createdBy,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_by',
      serializers.serialize(object.updatedBy,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.picture;
    if (value != null) {
      result
        ..add('picture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deletedBy;
    if (value != null) {
      result
        ..add('deleted_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deletedAt;
    if (value != null) {
      result
        ..add('deleted_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id_user':
          result.idUser = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
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
        case 'picture':
          result.picture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_active':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'updated_by':
          result.updatedBy = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'deleted_by':
          result.deletedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deleted_at':
          result.deletedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserModel extends UserModel {
  @override
  final String idUser;
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
  final String? picture;
  @override
  final int isActive;
  @override
  final String createdBy;
  @override
  final String createdAt;
  @override
  final String updatedBy;
  @override
  final String updatedAt;
  @override
  final String? deletedBy;
  @override
  final String? deletedAt;

  factory _$UserModel([void Function(UserModelBuilder)? updates]) =>
      (new UserModelBuilder()..update(updates))._build();

  _$UserModel._(
      {required this.idUser,
      required this.idUserGroup,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      this.picture,
      required this.isActive,
      required this.createdBy,
      required this.createdAt,
      required this.updatedBy,
      required this.updatedAt,
      this.deletedBy,
      this.deletedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(idUser, r'UserModel', 'idUser');
    BuiltValueNullFieldError.checkNotNull(
        idUserGroup, r'UserModel', 'idUserGroup');
    BuiltValueNullFieldError.checkNotNull(firstname, r'UserModel', 'firstname');
    BuiltValueNullFieldError.checkNotNull(lastname, r'UserModel', 'lastname');
    BuiltValueNullFieldError.checkNotNull(username, r'UserModel', 'username');
    BuiltValueNullFieldError.checkNotNull(email, r'UserModel', 'email');
    BuiltValueNullFieldError.checkNotNull(isActive, r'UserModel', 'isActive');
    BuiltValueNullFieldError.checkNotNull(createdBy, r'UserModel', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(createdAt, r'UserModel', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(updatedBy, r'UserModel', 'updatedBy');
    BuiltValueNullFieldError.checkNotNull(updatedAt, r'UserModel', 'updatedAt');
  }

  @override
  UserModel rebuild(void Function(UserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuilder toBuilder() => new UserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        idUser == other.idUser &&
        idUserGroup == other.idUserGroup &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        username == other.username &&
        email == other.email &&
        picture == other.picture &&
        isActive == other.isActive &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        updatedBy == other.updatedBy &&
        updatedAt == other.updatedAt &&
        deletedBy == other.deletedBy &&
        deletedAt == other.deletedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, idUser.hashCode),
                                                        idUserGroup.hashCode),
                                                    firstname.hashCode),
                                                lastname.hashCode),
                                            username.hashCode),
                                        email.hashCode),
                                    picture.hashCode),
                                isActive.hashCode),
                            createdBy.hashCode),
                        createdAt.hashCode),
                    updatedBy.hashCode),
                updatedAt.hashCode),
            deletedBy.hashCode),
        deletedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserModel')
          ..add('idUser', idUser)
          ..add('idUserGroup', idUserGroup)
          ..add('firstname', firstname)
          ..add('lastname', lastname)
          ..add('username', username)
          ..add('email', email)
          ..add('picture', picture)
          ..add('isActive', isActive)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('updatedBy', updatedBy)
          ..add('updatedAt', updatedAt)
          ..add('deletedBy', deletedBy)
          ..add('deletedAt', deletedAt))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel? _$v;

  String? _idUser;
  String? get idUser => _$this._idUser;
  set idUser(String? idUser) => _$this._idUser = idUser;

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

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  int? _isActive;
  int? get isActive => _$this._isActive;
  set isActive(int? isActive) => _$this._isActive = isActive;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedBy;
  String? get updatedBy => _$this._updatedBy;
  set updatedBy(String? updatedBy) => _$this._updatedBy = updatedBy;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _deletedBy;
  String? get deletedBy => _$this._deletedBy;
  set deletedBy(String? deletedBy) => _$this._deletedBy = deletedBy;

  String? _deletedAt;
  String? get deletedAt => _$this._deletedAt;
  set deletedAt(String? deletedAt) => _$this._deletedAt = deletedAt;

  UserModelBuilder();

  UserModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idUser = $v.idUser;
      _idUserGroup = $v.idUserGroup;
      _firstname = $v.firstname;
      _lastname = $v.lastname;
      _username = $v.username;
      _email = $v.email;
      _picture = $v.picture;
      _isActive = $v.isActive;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _updatedBy = $v.updatedBy;
      _updatedAt = $v.updatedAt;
      _deletedBy = $v.deletedBy;
      _deletedAt = $v.deletedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserModel;
  }

  @override
  void update(void Function(UserModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserModel build() => _build();

  _$UserModel _build() {
    final _$result = _$v ??
        new _$UserModel._(
            idUser: BuiltValueNullFieldError.checkNotNull(
                idUser, r'UserModel', 'idUser'),
            idUserGroup: BuiltValueNullFieldError.checkNotNull(
                idUserGroup, r'UserModel', 'idUserGroup'),
            firstname: BuiltValueNullFieldError.checkNotNull(
                firstname, r'UserModel', 'firstname'),
            lastname: BuiltValueNullFieldError.checkNotNull(
                lastname, r'UserModel', 'lastname'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'UserModel', 'username'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'UserModel', 'email'),
            picture: picture,
            isActive: BuiltValueNullFieldError.checkNotNull(
                isActive, r'UserModel', 'isActive'),
            createdBy: BuiltValueNullFieldError.checkNotNull(
                createdBy, r'UserModel', 'createdBy'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'UserModel', 'createdAt'),
            updatedBy: BuiltValueNullFieldError.checkNotNull(
                updatedBy, r'UserModel', 'updatedBy'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(updatedAt, r'UserModel', 'updatedAt'),
            deletedBy: deletedBy,
            deletedAt: deletedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
