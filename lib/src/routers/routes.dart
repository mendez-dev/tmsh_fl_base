import 'package:base/src/modules/async/router/async_router.dart';
import 'package:base/src/modules/auth/routes/auth_routes.dart';
import 'package:base/src/modules/examples/router/examples_router.dart';
import 'package:base/src/modules/home/pages/home_page.dart';
import 'package:base/src/modules/settings/router/settings_routes.dart';
import 'package:base/src/pages/page_404.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../utils/logger.dart';

class Routes {
  /// Genera la configuracion de las rutas y sub rutas de la aplicación
  static void configureRoutes(FluroRouter router) {
    // Maneja las rutas no encontradas, mostrando una pantalla de 404 not found
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      logger.e("ROUTE WAS NOT FOUND !!!");
      return const Page404();
    });

    // Declaración de rutas
    router.define("home",
        transitionType: TransitionType.inFromRight,
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                  const HomePage(),
        ));
    // Importacion de rutas por modulos
    SettingsRoutes.configureRoutes(router);
    AuthRoutes.configureRoutes(router);
    ExamplesRoutes.configureRoutes(router);
    AsyncRoutes.configureRoutes(router);
  }
}
