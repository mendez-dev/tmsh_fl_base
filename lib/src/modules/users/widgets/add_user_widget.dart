import 'package:base/src/helpers/dialog_helper.dart';
import 'package:base/src/modules/users/models/user_create.dart';
import 'package:base/src/modules/users/repositories/user_repository.dart';
import 'package:base/src/modules/users/repositories/user_repository_local.dart';
import 'package:base/src/validations/validations.dart';
import 'package:base/src/widgets/buttons_widget.dart';
import 'package:base/src/widgets/forms_widgets.dart';
import 'package:conduit_password_hash/pbkdf2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:crypto/crypto.dart';

import '../../../utils/logger.dart';
import '../models/user_response.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({Key? key}) : super(key: key);

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final firstNameValidator =
      ValidationBuilder(fieldName: "Nombre").required().maxLength(100).build();

  final lastNameValidator = ValidationBuilder(fieldName: "Apellido")
      .required()
      .maxLength(100)
      .build();

  final usernameValidator =
      ValidationBuilder(fieldName: "Usuario").required().maxLength(30).build();

  final emailValidator = ValidationBuilder(fieldName: "Correo")
      .required()
      .maxLength(50)
      .email()
      .build();

  final passwordValidator =
      ValidationBuilder(fieldName: "Contraseña").required().password().build();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuario"),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    InputTextWidget(
                      icon: FontAwesomeIcons.idCard,
                      label: "Nombre",
                      controller: firstNameController,
                      validator: firstNameValidator,
                    ),
                    InputTextWidget(
                      icon: FontAwesomeIcons.idCard,
                      label: "Apellido",
                      controller: lastNameController,
                      validator: lastNameValidator,
                    ),
                    InputTextWidget(
                      icon: FontAwesomeIcons.userAlt,
                      label: "Usuario",
                      controller: usernameController,
                      validator: usernameValidator,
                    ),
                    InputTextWidget(
                      icon: FontAwesomeIcons.envelope,
                      label: "Correo",
                      controller: emailController,
                      validator: emailValidator,
                    ),
                    InputTextWidget(
                      onChanged: (_) => setState(() {}),
                      icon: FontAwesomeIcons.lock,
                      label: "Contraseña",
                      controller: passwordController,
                      validator: passwordValidator,
                      obscureText: true,
                    ),
                    InputTextWidget(
                      onChanged: (_) => setState(() {}),
                      icon: FontAwesomeIcons.lock,
                      label: "Confirmar contraseña",
                      controller: confirmPasswordController,
                      validator:
                          ValidationBuilder(fieldName: "Confirmar contraseña")
                              .required()
                              .sameAs(passwordController.text,
                                  "Las contraseñas no coinciden")
                              .build(),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ButtonWidget(
                              type: ButtonType.outline,
                              isExpanded: true,
                              text: "Cancelar",
                              onTap: () => Navigator.pop(context)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ButtonWidget(text: "Guardar", onTap: _save),
                        )
                      ],
                    )
                  ],
                ),
              ))),
    );
  }

  _save() async {
    if (formKey.currentState!.validate()) {
      String idUserGroup = await RepositoryProvider.of<UserRepository>(context)
          .getAdminGroupId();
      final String passwordHash =
          await _encryptPassword(passwordController.text);
      // Creamos el objeto usercreate para enviarlo al backend
      UserCreate userCreate = UserCreate((b) => b
        ..firstname = firstNameController.text
        ..lastname = lastNameController.text
        ..username = usernameController.text
        ..email = emailController.text
        ..password = passwordHash
        ..idUserGroup = idUserGroup);

      final UserResponse response =
          await RepositoryProvider.of<UserRepositoryLocal>(context)
              .createUser(userCreate);

      if (response.success) {
        await showSuccessDialog(context: context, title: "Usuario creado");
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(msg: response.errors!.first);
      }
    }
  }

  // Funcion para encritar la contraseña usando hash_pbkdf2
  Future<String> _encryptPassword(String password) async {
    final String salt = GlobalConfiguration().getValue<String>('salt');
    final int iterations = GlobalConfiguration().getValue<int>('iterations');
    final generator = PBKDF2(hashAlgorithm: sha512);
    var hash = generator.generateKey(password, salt, iterations, 64);
    return bin2hex(hash);
  }

  static String bin2hex(List<int> bin) {
    var buffer = "";
    for (var b in bin) {
      buffer += (b + 0x100).toRadixString(16).substring(1);
    }
    return buffer;
  }
}
