// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SettingsModel> _$settingsModelSerializer =
    new _$SettingsModelSerializer();
Serializer<SettingsResponse> _$settingsResponseSerializer =
    new _$SettingsResponseSerializer();

class _$SettingsModelSerializer implements StructuredSerializer<SettingsModel> {
  @override
  final Iterable<Type> types = const [SettingsModel, _$SettingsModel];
  @override
  final String wireName = 'SettingsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SettingsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'app_name',
      serializers.serialize(object.appName,
          specifiedType: const FullType(String)),
      'defaultTax',
      serializers.serialize(object.defaultTax,
          specifiedType: const FullType(double)),
      'defaultCurrency',
      serializers.serialize(object.defaultCurrency,
          specifiedType: const FullType(String)),
      'main_color',
      serializers.serialize(object.mainColor,
          specifiedType: const FullType(String)),
      'main_dark_color',
      serializers.serialize(object.mainDarkColor,
          specifiedType: const FullType(String)),
      'second_color',
      serializers.serialize(object.secondColor,
          specifiedType: const FullType(String)),
      'second_dark_color',
      serializers.serialize(object.secondDarkColor,
          specifiedType: const FullType(String)),
      'accent_color',
      serializers.serialize(object.accentColor,
          specifiedType: const FullType(String)),
      'accent_dark_color',
      serializers.serialize(object.accentDarkColor,
          specifiedType: const FullType(String)),
      'scaffold_dark_color',
      serializers.serialize(object.scaffoldDarkColor,
          specifiedType: const FullType(String)),
      'scaffold_color',
      serializers.serialize(object.scaffoldColor,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SettingsModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SettingsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'app_name':
          result.appName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'defaultTax':
          result.defaultTax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'defaultCurrency':
          result.defaultCurrency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_color':
          result.mainColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_dark_color':
          result.mainDarkColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'second_color':
          result.secondColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'second_dark_color':
          result.secondDarkColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accent_color':
          result.accentColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accent_dark_color':
          result.accentDarkColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'scaffold_dark_color':
          result.scaffoldDarkColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'scaffold_color':
          result.scaffoldColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SettingsResponseSerializer
    implements StructuredSerializer<SettingsResponse> {
  @override
  final Iterable<Type> types = const [SettingsResponse, _$SettingsResponse];
  @override
  final String wireName = 'SettingsResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, SettingsResponse object,
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
            specifiedType: const FullType(SettingsModel)));
    }
    return result;
  }

  @override
  SettingsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SettingsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(SettingsModel))! as SettingsModel);
          break;
      }
    }

    return result.build();
  }
}

class _$SettingsModel extends SettingsModel {
  @override
  final String appName;
  @override
  final double defaultTax;
  @override
  final String defaultCurrency;
  @override
  final String mainColor;
  @override
  final String mainDarkColor;
  @override
  final String secondColor;
  @override
  final String secondDarkColor;
  @override
  final String accentColor;
  @override
  final String accentDarkColor;
  @override
  final String scaffoldDarkColor;
  @override
  final String scaffoldColor;

  factory _$SettingsModel([void Function(SettingsModelBuilder)? updates]) =>
      (new SettingsModelBuilder()..update(updates)).build();

  _$SettingsModel._(
      {required this.appName,
      required this.defaultTax,
      required this.defaultCurrency,
      required this.mainColor,
      required this.mainDarkColor,
      required this.secondColor,
      required this.secondDarkColor,
      required this.accentColor,
      required this.accentDarkColor,
      required this.scaffoldDarkColor,
      required this.scaffoldColor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(appName, 'SettingsModel', 'appName');
    BuiltValueNullFieldError.checkNotNull(
        defaultTax, 'SettingsModel', 'defaultTax');
    BuiltValueNullFieldError.checkNotNull(
        defaultCurrency, 'SettingsModel', 'defaultCurrency');
    BuiltValueNullFieldError.checkNotNull(
        mainColor, 'SettingsModel', 'mainColor');
    BuiltValueNullFieldError.checkNotNull(
        mainDarkColor, 'SettingsModel', 'mainDarkColor');
    BuiltValueNullFieldError.checkNotNull(
        secondColor, 'SettingsModel', 'secondColor');
    BuiltValueNullFieldError.checkNotNull(
        secondDarkColor, 'SettingsModel', 'secondDarkColor');
    BuiltValueNullFieldError.checkNotNull(
        accentColor, 'SettingsModel', 'accentColor');
    BuiltValueNullFieldError.checkNotNull(
        accentDarkColor, 'SettingsModel', 'accentDarkColor');
    BuiltValueNullFieldError.checkNotNull(
        scaffoldDarkColor, 'SettingsModel', 'scaffoldDarkColor');
    BuiltValueNullFieldError.checkNotNull(
        scaffoldColor, 'SettingsModel', 'scaffoldColor');
  }

  @override
  SettingsModel rebuild(void Function(SettingsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsModelBuilder toBuilder() => new SettingsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsModel &&
        appName == other.appName &&
        defaultTax == other.defaultTax &&
        defaultCurrency == other.defaultCurrency &&
        mainColor == other.mainColor &&
        mainDarkColor == other.mainDarkColor &&
        secondColor == other.secondColor &&
        secondDarkColor == other.secondDarkColor &&
        accentColor == other.accentColor &&
        accentDarkColor == other.accentDarkColor &&
        scaffoldDarkColor == other.scaffoldDarkColor &&
        scaffoldColor == other.scaffoldColor;
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
                                        $jc($jc(0, appName.hashCode),
                                            defaultTax.hashCode),
                                        defaultCurrency.hashCode),
                                    mainColor.hashCode),
                                mainDarkColor.hashCode),
                            secondColor.hashCode),
                        secondDarkColor.hashCode),
                    accentColor.hashCode),
                accentDarkColor.hashCode),
            scaffoldDarkColor.hashCode),
        scaffoldColor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SettingsModel')
          ..add('appName', appName)
          ..add('defaultTax', defaultTax)
          ..add('defaultCurrency', defaultCurrency)
          ..add('mainColor', mainColor)
          ..add('mainDarkColor', mainDarkColor)
          ..add('secondColor', secondColor)
          ..add('secondDarkColor', secondDarkColor)
          ..add('accentColor', accentColor)
          ..add('accentDarkColor', accentDarkColor)
          ..add('scaffoldDarkColor', scaffoldDarkColor)
          ..add('scaffoldColor', scaffoldColor))
        .toString();
  }
}

class SettingsModelBuilder
    implements Builder<SettingsModel, SettingsModelBuilder> {
  _$SettingsModel? _$v;

  String? _appName;
  String? get appName => _$this._appName;
  set appName(String? appName) => _$this._appName = appName;

  double? _defaultTax;
  double? get defaultTax => _$this._defaultTax;
  set defaultTax(double? defaultTax) => _$this._defaultTax = defaultTax;

  String? _defaultCurrency;
  String? get defaultCurrency => _$this._defaultCurrency;
  set defaultCurrency(String? defaultCurrency) =>
      _$this._defaultCurrency = defaultCurrency;

  String? _mainColor;
  String? get mainColor => _$this._mainColor;
  set mainColor(String? mainColor) => _$this._mainColor = mainColor;

  String? _mainDarkColor;
  String? get mainDarkColor => _$this._mainDarkColor;
  set mainDarkColor(String? mainDarkColor) =>
      _$this._mainDarkColor = mainDarkColor;

  String? _secondColor;
  String? get secondColor => _$this._secondColor;
  set secondColor(String? secondColor) => _$this._secondColor = secondColor;

  String? _secondDarkColor;
  String? get secondDarkColor => _$this._secondDarkColor;
  set secondDarkColor(String? secondDarkColor) =>
      _$this._secondDarkColor = secondDarkColor;

  String? _accentColor;
  String? get accentColor => _$this._accentColor;
  set accentColor(String? accentColor) => _$this._accentColor = accentColor;

  String? _accentDarkColor;
  String? get accentDarkColor => _$this._accentDarkColor;
  set accentDarkColor(String? accentDarkColor) =>
      _$this._accentDarkColor = accentDarkColor;

  String? _scaffoldDarkColor;
  String? get scaffoldDarkColor => _$this._scaffoldDarkColor;
  set scaffoldDarkColor(String? scaffoldDarkColor) =>
      _$this._scaffoldDarkColor = scaffoldDarkColor;

  String? _scaffoldColor;
  String? get scaffoldColor => _$this._scaffoldColor;
  set scaffoldColor(String? scaffoldColor) =>
      _$this._scaffoldColor = scaffoldColor;

  SettingsModelBuilder();

  SettingsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appName = $v.appName;
      _defaultTax = $v.defaultTax;
      _defaultCurrency = $v.defaultCurrency;
      _mainColor = $v.mainColor;
      _mainDarkColor = $v.mainDarkColor;
      _secondColor = $v.secondColor;
      _secondDarkColor = $v.secondDarkColor;
      _accentColor = $v.accentColor;
      _accentDarkColor = $v.accentDarkColor;
      _scaffoldDarkColor = $v.scaffoldDarkColor;
      _scaffoldColor = $v.scaffoldColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SettingsModel;
  }

  @override
  void update(void Function(SettingsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsModel build() {
    final _$result = _$v ??
        new _$SettingsModel._(
            appName: BuiltValueNullFieldError.checkNotNull(
                appName, 'SettingsModel', 'appName'),
            defaultTax: BuiltValueNullFieldError.checkNotNull(
                defaultTax, 'SettingsModel', 'defaultTax'),
            defaultCurrency: BuiltValueNullFieldError.checkNotNull(
                defaultCurrency, 'SettingsModel', 'defaultCurrency'),
            mainColor: BuiltValueNullFieldError.checkNotNull(
                mainColor, 'SettingsModel', 'mainColor'),
            mainDarkColor: BuiltValueNullFieldError.checkNotNull(
                mainDarkColor, 'SettingsModel', 'mainDarkColor'),
            secondColor: BuiltValueNullFieldError.checkNotNull(
                secondColor, 'SettingsModel', 'secondColor'),
            secondDarkColor: BuiltValueNullFieldError.checkNotNull(
                secondDarkColor, 'SettingsModel', 'secondDarkColor'),
            accentColor: BuiltValueNullFieldError.checkNotNull(
                accentColor, 'SettingsModel', 'accentColor'),
            accentDarkColor:
                BuiltValueNullFieldError.checkNotNull(accentDarkColor, 'SettingsModel', 'accentDarkColor'),
            scaffoldDarkColor: BuiltValueNullFieldError.checkNotNull(scaffoldDarkColor, 'SettingsModel', 'scaffoldDarkColor'),
            scaffoldColor: BuiltValueNullFieldError.checkNotNull(scaffoldColor, 'SettingsModel', 'scaffoldColor'));
    replace(_$result);
    return _$result;
  }
}

class _$SettingsResponse extends SettingsResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final SettingsModel? data;

  factory _$SettingsResponse(
          [void Function(SettingsResponseBuilder)? updates]) =>
      (new SettingsResponseBuilder()..update(updates)).build();

  _$SettingsResponse._({required this.code, required this.message, this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, 'SettingsResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(
        message, 'SettingsResponse', 'message');
  }

  @override
  SettingsResponse rebuild(void Function(SettingsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsResponseBuilder toBuilder() =>
      new SettingsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsResponse &&
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
    return (newBuiltValueToStringHelper('SettingsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class SettingsResponseBuilder
    implements Builder<SettingsResponse, SettingsResponseBuilder> {
  _$SettingsResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  SettingsModelBuilder? _data;
  SettingsModelBuilder get data => _$this._data ??= new SettingsModelBuilder();
  set data(SettingsModelBuilder? data) => _$this._data = data;

  SettingsResponseBuilder();

  SettingsResponseBuilder get _$this {
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
  void replace(SettingsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SettingsResponse;
  }

  @override
  void update(void Function(SettingsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SettingsResponse build() {
    _$SettingsResponse _$result;
    try {
      _$result = _$v ??
          new _$SettingsResponse._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, 'SettingsResponse', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'SettingsResponse', 'message'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SettingsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
