import 'package:base/src/modules/users/models/user_model.dart';
import 'package:base/src/modules/users/models/users_pagination.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../components/smart_refresh.dart';

class UserPage extends StatefulWidget {
  const UserPage([Key? key]) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresh<UsersPagination, UserModel>(
        title: "Usuarios",
        listViewBuilder: (item) => ListTile(
              leading: const CircleAvatar(
                  child: Center(child: Icon(FontAwesomeIcons.solidUser))),
              title: Text("${item.firstname} ${item.lastname}"),
              subtitle: Text(item.email),
              trailing: const Icon(Icons.chevron_right),
            ),
        getData:
            RepositoryProvider.of<UserRepository>(context).getUserPagination);
  }
}
