import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
  BuildContext context;
  DateTime? currentBackPressTime;

  Helpers.of(this.context);

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Pulse otra vez para salir");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
