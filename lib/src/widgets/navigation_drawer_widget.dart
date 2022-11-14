import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

import '../helpers/dialog_helper.dart';
import '../helpers/sesion_helper.dart';
import '../modules/auth/bloc/bloc/auth_bloc.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                    padding: const EdgeInsets.all(0),
                    child: UserAccountsDrawerHeader(
                        currentAccountPicture: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            FontAwesomeIcons.userAlt,
                          ),
                        ),
                        currentAccountPictureSize: const Size(55, 55),
                        accountName: Text(
                          "${state.user?.firstname} ${state.user?.lastname}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        accountEmail: Text(
                          state.user?.email ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ))),
                NavigationListTile(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, 'home'),
                    title: "Inicio",
                    subtitle: "Página principal",
                    icon: FontAwesomeIcons.home),
                NavigationListTile(
                  title: "Usuarios",
                  subtitle: "Administrar usuarios",
                  icon: FontAwesomeIcons.solidUser,
                  onTap: () => Navigator.pushNamed(context, 'users'),
                ),
                const Divider(),
                NavigationListTile(
                  title: "Ajustes",
                  subtitle: "Administrar configuración",
                  icon: FontAwesomeIcons.cogs,
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, 'settings'),
                ),
                NavigationListTile(
                  title: "Cerrar sesión",
                  subtitle: "Salir de la aplicación",
                  icon: FontAwesomeIcons.signOutAlt,
                  onTap: () async {
                    bool response = await showConfirmationDialog(
                        context: context,
                        title: "¿Cerrar sesión?",
                        description:
                            "Para acceder de nuevo deberás ingresar tus credenciales.");

                    if (response) {
                      signOut(context);
                    }
                  },
                ),
                const Divider(),
                NavigationListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DatabaseList(
                                  dbPath:
                                      "/storage/emulated/0/Android/data/com.tmsh.base/files",
                                ))),
                    title: "Base de datos",
                    subtitle: "Visualisar registros",
                    icon: FontAwesomeIcons.database)
              ],
            ),
          ),
        );
      },
    );
  }
}

class NavigationListTile extends StatelessWidget {
  const NavigationListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: Theme.of(context).textTheme.subtitle1),
      subtitle: Text(subtitle),
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Center(
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
