import 'package:base/src/modules/examples/pages/buttons_page.dart';
import 'package:base/src/modules/examples/pages/infinite_scroll_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class ExamplesRoutes {
  static void configureRoutes(FluroRouter router) {
    router.define("buttonsTypes",
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                  const ButtonsPage(),
        ));

    router.define("infiniteScroll",
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                  const InfiniteScrollPage(),
        ));
  }
}
