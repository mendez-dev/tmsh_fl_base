import 'package:base/src/modules/async/bloc/download/download_bloc.dart';
import 'package:base/src/modules/async/repository/async_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../repositories/network/network_repository.dart';

// Crear una widget con un scaffold y un appbar con un título
// y en el body un texto centrado
class AsyncPage extends StatelessWidget {
  const AsyncPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Sincronización de datos"),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor),
          height: 225,
          child: Column(
            children: [
              SizedBox(
                  height: 140,
                  child: Lottie.asset('assets/lotties/async.json')),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sincronizando datos entre la aplicación y el servidor",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            width: double.infinity,
            child: const Text("Sincronización de datos automática")),
        RadioListTile(
          title: const Text("Sincronizar automática"),
          subtitle: const Text(
              "La aplicación subirá datos al servidor en cada operación, y cada 15 minutos estará consultando si hay datos nuevos"),
          value: 2,
          groupValue: 1,
          onChanged: (value) {},
        ),
        RadioListTile(
          title: const Text("Sincronización manual"),
          subtitle: const Text(
              "Unicamente se sincronizaran los datos cuando el usuario acceda a la opción de \"Descarga de datos\" o \"Subida de datos\"."),
          value: 1,
          groupValue: 1,
          onChanged: (value) {},
        ),
        const Divider(),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            width: double.infinity,
            child: const Text("Sincronización de datos manual")),
        ListTile(
          leading: const Icon(FontAwesomeIcons.download),
          title: const Text("Descarga de datos"),
          subtitle: const Text("Descargar de datos actualizados"),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.pushNamed(context, "download"),
        ),
        const ListTile(
          leading: Icon(FontAwesomeIcons.upload),
          title: Text("Subida de datos"),
          subtitle: Text("Subir datos locales al servidor"),
          trailing: Icon(Icons.chevron_right),
        ),
        const ListTile(
          leading: Icon(FontAwesomeIcons.database),
          title: Text("Borrar base de datos"),
          subtitle: Text(
              "Borrar la base de datos local y descargar datos nuevamente"),
          trailing: Icon(Icons.chevron_right),
        ),
      ])),
    );
  }
}
