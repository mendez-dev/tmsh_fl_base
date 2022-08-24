import 'package:base/src/modules/async/pages/async_page.dart';

import '../pages/download_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

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
