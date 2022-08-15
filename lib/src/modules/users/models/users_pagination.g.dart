// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_pagination.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersPagination> _$usersPaginationSerializer =
    new _$UsersPaginationSerializer();

class _$UsersPaginationSerializer
    implements StructuredSerializer<UsersPagination> {
  @override
  final Iterable<Type> types = const [UsersPagination, _$UsersPagination];
  @override
  final String wireName = 'UsersPagination';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersPagination object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserModel)])),
      'current_page',
      serializers.serialize(object.currentPage,
          specifiedType: const FullType(int)),
      'total_pages',
      serializers.serialize(object.totalPages,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  UsersPagination deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersPaginationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserModel)]))!
              as BuiltList<Object?>);
          break;
        case 'current_page':
          result.currentPage = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersPagination extends UsersPagination {
  @override
  final BuiltList<UserModel> data;
  @override
  final int currentPage;
  @override
  final int totalPages;

  factory _$UsersPagination([void Function(UsersPaginationBuilder)? updates]) =>
      (new UsersPaginationBuilder()..update(updates))._build();

  _$UsersPagination._(
      {required this.data, required this.currentPage, required this.totalPages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'UsersPagination', 'data');
    BuiltValueNullFieldError.checkNotNull(
        currentPage, r'UsersPagination', 'currentPage');
    BuiltValueNullFieldError.checkNotNull(
        totalPages, r'UsersPagination', 'totalPages');
  }

  @override
  UsersPagination rebuild(void Function(UsersPaginationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersPaginationBuilder toBuilder() =>
      new UsersPaginationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersPagination &&
        data == other.data &&
        currentPage == other.currentPage &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, data.hashCode), currentPage.hashCode), totalPages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersPagination')
          ..add('data', data)
          ..add('currentPage', currentPage)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class UsersPaginationBuilder
    implements Builder<UsersPagination, UsersPaginationBuilder> {
  _$UsersPagination? _$v;

  ListBuilder<UserModel>? _data;
  ListBuilder<UserModel> get data =>
      _$this._data ??= new ListBuilder<UserModel>();
  set data(ListBuilder<UserModel>? data) => _$this._data = data;

  int? _currentPage;
  int? get currentPage => _$this._currentPage;
  set currentPage(int? currentPage) => _$this._currentPage = currentPage;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  UsersPaginationBuilder();

  UsersPaginationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _currentPage = $v.currentPage;
      _totalPages = $v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersPagination other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersPagination;
  }

  @override
  void update(void Function(UsersPaginationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersPagination build() => _build();

  _$UsersPagination _build() {
    _$UsersPagination _$result;
    try {
      _$result = _$v ??
          new _$UsersPagination._(
              data: data.build(),
              currentPage: BuiltValueNullFieldError.checkNotNull(
                  currentPage, r'UsersPagination', 'currentPage'),
              totalPages: BuiltValueNullFieldError.checkNotNull(
                  totalPages, r'UsersPagination', 'totalPages'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersPagination', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
