import 'package:base/src/components/buttons.dart';
import 'package:flutter/material.dart';
class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tipos de botones"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Button(onTap:(){} , text: "Estandar"),
              Button(onTap:(){} , text: "Expandido", isExpanded: true),
              Button(onTap:(){} , text: "Redondeado", isRounded: true),
              Button(onTap:(){} , text: "Azul", color: Colors.blue),
              Button(onTap:(){} , text: "Estandar", type: ButtonType.outline),
              Button(onTap:(){} , text: "Expandido", type: ButtonType.outline, isExpanded: true),
              Button(onTap:(){} , text: "Redodeado", type: ButtonType.outline, isRounded: true),
              Button(onTap:(){} , text: "Verde", type: ButtonType.outline, color: Colors.green,),
              Button(onTap:(){} , text: "Cargando", isLoading: true,),
            ],
          ),
        ),
      ),
   );
  }
}