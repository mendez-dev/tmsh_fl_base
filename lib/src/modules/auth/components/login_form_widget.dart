import 'package:base/src/helpers/validations_helper.dart';
import 'package:base/src/modules/auth/models/auth_response.dart';
import 'package:base/src/modules/auth/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:global_configuration/global_configuration.dart';

import '../../../components/buttons.dart';
import '../../../components/form.dart';
import '../../../utils/logger.dart';
import '../bloc/bloc/auth_bloc.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: const [
                Text(
                  "Iniciar sesión",
                  style: TextStyle(fontSize: 20),
                ),
                InputText(
                    validator: emailValidator,
                    label: "Correo",
                    icon: FontAwesomeIcons.at,
                    type: InputTextStyle.circularBorder),
                InputText(
                    label: "Contraseña",
                    icon: FontAwesomeIcons.key,
                    type: InputTextStyle.circularBorder)
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Button(
                padding: const EdgeInsets.all(15),
                text: "Login",
                isRounded: true,
                isExpanded: true,
                onTap: () async {
                  if (!formKey.currentState!.validate()) return;
                  AuthResponse auth =
                      await RepositoryProvider.of<AuthRepository>(context)
                          .login(username: "admin", password: "admin");
                  logger.v(auth);
                },
              ),
              // const SizedBox(height: 10),
              if (GlobalConfiguration().get("allow_account_creation")) ...[
                Button(
                    padding: const EdgeInsets.all(15),
                    text: "Create new account",
                    isExpanded: true,
                    isRounded: true,
                    type: ButtonType.outline,
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
