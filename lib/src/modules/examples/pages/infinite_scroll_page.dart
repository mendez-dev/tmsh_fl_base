import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/users_pagination.dart';
import 'package:base/src/modules/users/models/users_pagination_response.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:base/src/modules/users/repositories/user_repository_impl.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:base/src/widgets/error_404_widget.dart';
import 'package:base/src/widgets/error_500_widget.dart';
import 'package:base/src/widgets/smart_refresh_widget.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../repositories/database_repository/database_repository.dart';

class InfiniteScrollPage extends StatelessWidget {
  const InfiniteScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserRepository>(
      create: (context) => UserRepositoryImpl(
          preferences: RepositoryProvider.of<PreferencesRepository>(context),
          database: RepositoryProvider.of<DatabaseRepository>(context),
          network: RepositoryProvider.of<NetworkRepository>(context)),
      child: const NewWidget(),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefreshWidget<UsersPagination, UserModel>(
      title: "Usuarios",
      getData: RepositoryProvider.of<UserRepository>(context).getUserPagination,
      listViewBuilder: (UserModel item) => ListTile(
        leading: const CircleAvatar(
            child: Center(child: Icon(FontAwesomeIcons.solidUser))),
        title: Text("${item.firstname} ${item.lastname}"),
        subtitle: Text(item.email),
        trailing: const Icon(Icons.chevron_right),
      ),
      noDataWidget: const Error404Widget(
        message: "No se encontraron registros",
      ),
      errorWidget: const Error500Widget(),
    );
  }
}
