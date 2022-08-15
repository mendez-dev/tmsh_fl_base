import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/dialog_helper.dart';
import '../helpers/sesion_helper.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(child: Placeholder()),
            NavigationListTile(
                onTap: () => Navigator.pushReplacementNamed(context, 'home'),
                title: "Inicio",
                subtitle: "Página principal",
                icon: FontAwesomeIcons.home),
            NavigationListTile(
              title: "Usuarios",
              subtitle: "Administrar usuarios",
              icon: FontAwesomeIcons.solidUser,
              onTap: () {},
            ),
            const Divider(),
            NavigationListTile(
              title: "Ajustes",
              subtitle: "Administrar configuración",
              icon: FontAwesomeIcons.cogs,
              onTap: () => Navigator.pushReplacementNamed(context, 'settings'),
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
          ],
        ),
      ),
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
