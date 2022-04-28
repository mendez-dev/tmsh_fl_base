import 'package:base/src/modules/settings/models/theme_model.dart';
import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import '../bloc/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
                title: "Account",
                tiles: [
                  SettingsTile(
                    leading: const Icon(FontAwesomeIcons.signOutAlt),
                    title: "Sign off",
                    subtitle: "Exit application",
                    onPressed: (BuildContext context) async {
                      bool? response = await Alert(context: context, title: "Sign off?", buttons: [
                        DialogButton(child: const Text("No", style: TextStyle(color: Colors.white)), onPressed: () => Navigator.pop(context, false)),
                        DialogButton(child: const Text("Yes", style: TextStyle(color: Colors.white),), onPressed: () => Navigator.pop(context, true))
                      ]).show();
                      
                      if (response != null) {
                        if(response){
                          await RepositoryProvider.of<PreferencesRepository>(context).remove('authToken');
                          Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
                        }
                      }
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: "Customization",
                tiles: [
                  SettingsTile.switchTile(
                      leading: const Icon(FontAwesomeIcons.moon),
                      title: "Dark theme",
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
