import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/users_pagination.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import '../models/user_create.dart';
import '../models/users_pagination_response.dart';

part 'serializer.g.dart';

@SerializersFor(
    [UserModel, UserCreate, UsersPaginationResponse, UsersPagination])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
