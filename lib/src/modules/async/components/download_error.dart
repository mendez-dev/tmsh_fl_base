import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../components/buttons.dart';
import '../bloc/download/download_bloc.dart';

// Crear un stateless widget con un container que tenga una animación lottie centrada en el widget
class DownloadError extends StatelessWidget {
  const DownloadError({Key? key}) : super(key: key);
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
                    child: Lottie.asset('assets/lotties/error.json'))),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Error al descargar",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.red),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "No se pudo descargar los datos, verifique su conexión a internet e intente de nuevo",
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
                child: Button(
                    color: Colors.red,
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
