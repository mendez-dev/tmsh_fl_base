// Importaciones de terceros
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../pages/users_page.dart';

// Definimos las rutas del modulo usuarios
class UserRoutes {
  static void configureRoutes(FluroRouter router) {
    router.define("users",
        transitionType: TransitionType.inFromRight,
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                  const UserPage(),
        ));
  }
}
