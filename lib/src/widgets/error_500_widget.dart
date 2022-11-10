import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error500Widget extends StatelessWidget {
  const Error500Widget({
    Key? key,
    this.message = "Ocurrio un error interno",
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
              child: Lottie.asset('assets/lotties/500.json')),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(message)
      ],
    );
  }
}
