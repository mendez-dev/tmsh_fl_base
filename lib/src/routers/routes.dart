import 'package:base/src/modules/auth/routes/auth_routes.dart';
import 'package:base/src/modules/movies/routes/movies_routes.dart';
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
    
    AuthRoutes.configureRoutes(router);
    SettingsRoutes.configureRoutes(router);
    MoviesRoutes.configureRoutes(router);
    
  }
}