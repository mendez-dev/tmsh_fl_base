
import 'package:base/src/modules/movies/pages/home_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class MoviesRoutes {
  static void configureRoutes(FluroRouter router) {
    router.define("home",
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                  const HomePage(),
        ));
  }
}
