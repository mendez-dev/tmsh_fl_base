import 'package:base/src/helpers/validations_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:global_configuration/global_configuration.dart';

import '../../../widgets/buttons_widget.dart';
import '../../../widgets/forms_widgets.dart';
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

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        // TODO: implement listener
      },
      builder: (BuildContext context, AuthState state) {
        return SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      "Iniciar sesión",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    InputTextWidget(
                        enabled: !state.isLoadingLogin,
                        controller: usernameController,
                        validator: usernameValidator,
                        label: "Usuario",
                        icon: FontAwesomeIcons.solidUser,
                        type: InputTextStyle.circularBorder),
                    InputTextWidget(
                        obscureText: true,
                        enabled: !state.isLoadingLogin,
                        controller: passwordController,
                        label: "Contraseña",
                        icon: FontAwesomeIcons.key,
                        type: InputTextStyle.circularBorder)
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  ButtonWidget(
                    isLoading: state.isLoadingLogin,
                    padding: const EdgeInsets.all(15),
                    text: "Iniciar sesión",
                    isRounded: true,
                    isExpanded: true,
                    onTap: () async {
                      if (!formKey.currentState!.validate()) return;

                      BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                          username: usernameController.text.trim(),
                          password: passwordController.text.trim()));
                    },
                  ),
                  // const SizedBox(height: 10),
                  if (GlobalConfiguration().get("allow_account_creation")) ...[
                    ButtonWidget(
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
      },
    );
  }
}
