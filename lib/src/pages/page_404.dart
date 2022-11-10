import 'package:base/src/components/error_404.dart';
import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Error404(),
    );
  }
}
