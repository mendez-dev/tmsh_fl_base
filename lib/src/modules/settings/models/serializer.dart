import 'package:base/src/modules/settings/models/settings_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:base/src/modules/settings/models/theme_model.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializer.g.dart';

@SerializersFor([SettingsModel, ThemeModel])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
