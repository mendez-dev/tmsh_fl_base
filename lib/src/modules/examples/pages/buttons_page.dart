import 'package:base/src/widgets/buttons_widget.dart';
import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tipos de botones"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonWidget(onTap: () {}, text: "Estandar"),
              ButtonWidget(onTap: () {}, text: "Expandido", isExpanded: true),
              ButtonWidget(onTap: () {}, text: "Redondeado", isRounded: true),
              ButtonWidget(onTap: () {}, text: "Azul", color: Colors.blue),
              ButtonWidget(
                  onTap: () {}, text: "Estandar", type: ButtonType.outlined),
              ButtonWidget(
                  onTap: () {},
                  text: "Expandido",
                  type: ButtonType.outlined,
                  isExpanded: true),
              ButtonWidget(
                  onTap: () {},
                  text: "Redodeado",
                  type: ButtonType.outlined,
                  isRounded: true),
              ButtonWidget(
                onTap: () {},
                text: "Verde",
                type: ButtonType.outlined,
                color: Colors.green,
              ),
              ButtonWidget(
                onTap: () {},
                text: "Cargando",
                isLoading: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
