import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:global_configuration/global_configuration.dart';

import '../../../components/buttons.dart';
import '../../../components/form.dart';
import '../bloc/bloc/auth_bloc.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Text(
                "Iniciar sesión",
                style: TextStyle(fontSize: 20),
              ),
              InputText(
                  label: "Correo",
                  icon: FontAwesomeIcons.at,
                  type: InputTextStyle.circularBorder),
              InputText(
                  label: "Contraseña",
                  icon: FontAwesomeIcons.key,
                  type: InputTextStyle.circularBorder)
            ],
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Button(
                padding: const EdgeInsets.all(15),
                text: "Login",
                isRounded: true,
                isExpanded: true,
                onTap: () {},
              ),
              // const SizedBox(height: 10),
              if (GlobalConfiguration().get("allow_account_creation")) ...[
                Button(
                    padding: const EdgeInsets.all(15),
                    isExpanded: true,
                    text: "Create new account",
                    type: ButtonType.outline,
                    isRounded: true,
                    onTap: () => BlocProvider.of<AuthBloc>(context)
                        .add(ChangePageStateEvent(2)))
              ],
              const SizedBox(height: 30)
            ],
          )
        ],
      ),
    );
  }
}
