import 'package:base/src/widgets/buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../settings/repositories/preferences/preferences_repository.dart';
import '../bloc/download/download_bloc.dart';

// Crear un stateless widget con un container que tenga una animación lottie centrada en el widget
class DownloadNoDataWidget extends StatelessWidget {
  const DownloadNoDataWidget({Key? key}) : super(key: key);
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
                    "No hay datos para descargar",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Todos los datos locales están actualizados",
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
                child: ButtonWidget(
                  text: "ACEPTAR",
                  isExpanded: true,
                  onTap: () => _continue(context),
                )),
          ],
        );
      },
    );
  }

  void _continue(BuildContext context) async {
    PreferencesRepository _preferencesRepository =
        RepositoryProvider.of<PreferencesRepository>(context);
    // Indicamos que se realizo el primer login con exito y a partir de
    // ahora se usara la base de datos local
    String initialRoute = await _preferencesRepository.getInitialRoute();
    if (initialRoute == "download") {
      _preferencesRepository.save<bool>("first_web_login", true);
      _preferencesRepository.save<String>("data_source", "LOCAL");
      _preferencesRepository.save<String>("initial_route", "home");
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
    } else {
      Navigator.of(context).pop();
    }
  }
}
