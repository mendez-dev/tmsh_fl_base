import 'package:base/src/widgets/navigation_drawer_widget.dart';
import 'package:base/src/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helpers.of(context).onWillPop,
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text("Inicio"),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, 'settings'),
                icon: const Icon(FontAwesomeIcons.cogs))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'users'),
          child: const Icon(FontAwesomeIcons.plus),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text("Login"),
                leading: const Icon(FontAwesomeIcons.signInAlt),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, "login"),
              ),
              ListTile(
                title: const Text("Ejemplos"),
                leading: const Icon(FontAwesomeIcons.mobile),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, "infiniteScroll"),
              ),
              ListTile(
                title: const Text("Desargar datos"),
                leading: const Icon(FontAwesomeIcons.mobile),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, "async"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
