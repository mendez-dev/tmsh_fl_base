import 'package:base/src/components/error_404.dart';
import 'package:base/src/components/error_500.dart';
import 'package:base/src/components/smart_refresh.dart';
import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/users_pagination.dart';
import 'package:base/src/modules/users/models/users_pagination_response.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:base/src/modules/users/repositories/user_repository_impl.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfiniteScrollPage extends StatelessWidget {
  const InfiniteScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<UserRepository>(
      create: (context) => UserRepositoryApi(
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
    return SmartRefresh<UsersPagination, UserModel>(
      title: "Usuarios",
      getData: (
          {int page = 1, int recordsPerPage = 10, String query = ""}) async {
        final UsersPaginationResponse response =
            await RepositoryProvider.of<UserRepository>(context)
                .getUserPagination(
                    page: page, query: query, recordsPerPage: recordsPerPage);
        if (response.code == 200) {
          return response.data!;
        } else {
          return UsersPagination((u) => u
            ..data = ListBuilder<UserModel>()
            ..currentPage = 0
            ..totalPages = 0);
        }
      },
      listViewBuilder: (UserModel item) => ListTile(
        leading: const CircleAvatar(
            child: Center(child: Icon(FontAwesomeIcons.solidUser))),
        title: Text("${item.firstname} ${item.lastname}"),
        subtitle: Text(item.email),
        trailing: const Icon(Icons.chevron_right),
      ),
      noDataWidget: const Error404(
        message: "No se encontraron registros",
      ),
      errorWidget: const Error500(),
    );
  }
}
