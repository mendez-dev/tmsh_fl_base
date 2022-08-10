import 'package:base/src/components/inifinite_scroll/infinite_scroll.dart';
import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/users_pagination.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:base/src/modules/users/repositories/user_repository_api.dart';
import 'package:base/src/repositories/network/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return InfiniteScroll<UsersPagination, UserModel>(
      getData: () =>
          RepositoryProvider.of<UserRepository>(context).getUserPagination(),
    );
  }
}
