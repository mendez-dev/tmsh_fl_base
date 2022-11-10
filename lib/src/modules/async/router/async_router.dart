// Importaciones de terceros
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// Importaciones propias
import '../pages/download_page.dart';
import '../pages/async_page.dart';

// Definimos las rutas del modulo de sincronización
class AsyncRoutes {
  static void configureRoutes(FluroRouter router) {
    router.define("async",
        transitionType: TransitionType.inFromRight,
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                  const AsyncPage(),
        ));
    router.define("download",
        transitionType: TransitionType.inFromRight,
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                  const DownloadPage(),
        ));
  }
}
