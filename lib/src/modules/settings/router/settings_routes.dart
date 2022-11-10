import '../pages/settings_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class SettingsRoutes {
  static void configureRoutes(FluroRouter router) {
    router.define("settings",
        transitionType: TransitionType.inFromRight,
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                  const SettingsPage(),
        ));
  }
}
