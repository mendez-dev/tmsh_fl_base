import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inicio"),
      actions: [IconButton(onPressed: () => Navigator.pushNamed(context, 'settings'), icon: const Icon(FontAwesomeIcons.cogs))],),
      body: const Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}