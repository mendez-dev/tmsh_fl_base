// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MoviesResponse> _$moviesResponseSerializer =
    new _$MoviesResponseSerializer();

class _$MoviesResponseSerializer
    implements StructuredSerializer<MoviesResponse> {
  @override
  final Iterable<Type> types = const [MoviesResponse, _$MoviesResponse];
  @override
  final String wireName = 'MoviesResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, MoviesResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(MovieModel)])),
      'total_pages',
      serializers.serialize(object.totalPages,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MoviesResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoviesResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MovieModel)]))!
              as BuiltList<Object?>);
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MoviesResponse extends MoviesResponse {
  @override
  final int page;
  @override
  final BuiltList<MovieModel> results;
  @override
  final int totalPages;

  factory _$MoviesResponse([void Function(MoviesResponseBuilder)? updates]) =>
      (new MoviesResponseBuilder()..update(updates)).build();

  _$MoviesResponse._(
      {required this.page, required this.results, required this.totalPages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(page, 'MoviesResponse', 'page');
    BuiltValueNullFieldError.checkNotNull(results, 'MoviesResponse', 'results');
    BuiltValueNullFieldError.checkNotNull(
        totalPages, 'MoviesResponse', 'totalPages');
  }

  @override
  MoviesResponse rebuild(void Function(MoviesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoviesResponseBuilder toBuilder() =>
      new MoviesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoviesResponse &&
        page == other.page &&
        results == other.results &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, page.hashCode), results.hashCode), totalPages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MoviesResponse')
          ..add('page', page)
          ..add('results', results)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class MoviesResponseBuilder
    implements Builder<MoviesResponse, MoviesResponseBuilder> {
  _$MoviesResponse? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  ListBuilder<MovieModel>? _results;
  ListBuilder<MovieModel> get results =>
      _$this._results ??= new ListBuilder<MovieModel>();
  set results(ListBuilder<MovieModel>? results) => _$this._results = results;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  MoviesResponseBuilder();

  MoviesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _results = $v.results.toBuilder();
      _totalPages = $v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoviesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoviesResponse;
  }

  @override
  void update(void Function(MoviesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MoviesResponse build() {
    _$MoviesResponse _$result;
    try {
      _$result = _$v ??
          new _$MoviesResponse._(
              page: BuiltValueNullFieldError.checkNotNull(
                  page, 'MoviesResponse', 'page'),
              results: results.build(),
              totalPages: BuiltValueNullFieldError.checkNotNull(
                  totalPages, 'MoviesResponse', 'totalPages'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MoviesResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
