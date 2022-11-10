import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/buttons_widget.dart';
import '../bloc/download/download_bloc.dart';

// Crear un stateless widget con un container que tenga una animación lottie centrada en el widget
class DownloadSuccessWidget extends StatelessWidget {
  const DownloadSuccessWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadBloc, DownloadState>(
      builder: (BuildContext context, DownloadState state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 225,
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor),
                width: double.infinity,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Lottie.asset('assets/lotties/success_white.json'))),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Datos descargados",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Los datos se descargaron correctamente",
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
              child: Container(
                padding: const EdgeInsets.all(20),
                child: ButtonWidget(
                    text: "Continuar",
                    isExpanded: true,
                    onTap: () => Navigator.of(context).pop()),
              ),
            ),
          ],
        );
      },
    );
  }
}
