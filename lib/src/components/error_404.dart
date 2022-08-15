import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error404 extends StatelessWidget {
  const Error404({
    Key? key,
    this.message = "Recurso no encontrado",
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
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
        Text(message)
      ],
    );
  }
}
