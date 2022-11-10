import 'package:base/src/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Crear un stateless widget con un container que tenga una animación lottie centrada en el widget
class GetDownloadInfo extends StatelessWidget {
  const GetDownloadInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 225,
            decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor),
            width: double.infinity,
            child: Lottie.asset('assets/lotties/infinite-loading.json')),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Conectando con el servidor",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Obteniendo información para la descarga de datos",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Button(
              type: ButtonType.outline,
              text: "Cancelar",
              isExpanded: true,
              onTap: () => Navigator.pop(context)),
        ),
      ],
    );
  }
}
