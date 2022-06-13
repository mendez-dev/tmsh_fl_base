import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../components/form.dart';
import '../bloc/bloc/auth_bloc.dart';
import 'buttons.dart';

class RegisterFormWindget extends StatelessWidget {
  const RegisterFormWindget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                const Text(
                  "Create new account",
                  style: TextStyle(fontSize: 20),
                ),
                InputText(
                  icon: FontAwesomeIcons.at,
                  label: "Correo",
                  validator: (String? value) =>
                      "Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido",
                ),
                InputText(
                  validator: (String? value) =>
                      "Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido",
                  type: InputTextStyle.circularBorder,
                  icon: FontAwesomeIcons.at,
                  label: "Contraseña",
                ),
                InputText(
                  validator: (String? value) =>
                      "Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido",
                  type: InputTextStyle.bordered,
                  icon: FontAwesomeIcons.at,
                  label: "Repetir Contraseña",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const LoginButton(
                text: "Crate account",
              ),
              const SizedBox(height: 10),
              LoginButton(
                  text: "Back to login",
                  type: CustomButtomType.outline,
                  onTap: () => BlocProvider.of<AuthBloc>(context)
                      .add(ChangePageStateEvent(1))),
              const SizedBox(height: 30)
            ],
          ),
        ],
      ),
    );
  }
}
