import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  width: _size.width * 0.8,
                  child: Lottie.asset('assets/lotties/404.json')),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Recurso no encontrado")
          ],
        ),
      );
  }
}