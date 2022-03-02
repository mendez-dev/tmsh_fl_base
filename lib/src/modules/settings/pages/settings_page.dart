import 'package:base/src/modules/settings/models/theme_model.dart';
import 'package:base/src/utils/logger.dart';

import '../bloc/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
      ),
      body: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (BuildContext context, SettingsState state) {
          // TODO: implement listener
        },
        builder: (BuildContext context, SettingsState state) {
          return SettingsList(
            darkBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            sections: [
              SettingsSection(
                title: "Cuenta",
                tiles: [
                  SettingsTile(
                    leading: const Icon(FontAwesomeIcons.idCard),
                    title: "Nombre",
                    subtitle: "Juan Pérez",
                  ),
                  SettingsTile(
                    leading: const Icon(FontAwesomeIcons.userTag),
                    title: "Rol",
                    subtitle: "Administrador",
                  ),
                  SettingsTile(
                    leading: const Icon(FontAwesomeIcons.userAlt),
                    title: "Nombre de usuario",
                    subtitle: "juanP123",
                  ),
                  SettingsTile(
                    leading: const Icon(FontAwesomeIcons.signOutAlt),
                    title: "Cerrar sesión",
                    subtitle: "Salir de la aplicación",
                    onPressed: (BuildContext context) => logger.i("Cerrar sesión"),
                  ),
                ],
              ),
              SettingsSection(
                title: "Apariencia",
                tiles: [
                  SettingsTile.switchTile(
                      leading: const Icon(FontAwesomeIcons.moon),
                      title: "Tema oscuro",
                      onToggle: (bool value) {
                        BlocProvider.of<SettingsBloc>(context).add(SetDarkModeEvent(value));
                      },
                      switchValue: state.theme == ThemeModel.dark)
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
