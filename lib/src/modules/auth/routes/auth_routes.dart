import 'package:base/src/modules/auth/pages/login_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AuthRoutes {
  static void configureRoutes(FluroRouter router) {
    router.define("login",
        handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> params) =>
                   const LoginPage(),
        ));
  }
}