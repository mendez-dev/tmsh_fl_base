import 'package:base/src/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../components/forms.dart';
import '../bloc/bloc/auth_bloc.dart';

class RegisterFormWindget extends StatefulWidget {
  const RegisterFormWindget({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterFormWindget> createState() => _RegisterFormWindgetState();
}

class _RegisterFormWindgetState extends State<RegisterFormWindget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Placeholder(),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const Button(
                padding: EdgeInsets.all(15),
                text: "Crate account",
                isExpanded: true,
                isRounded: true,
              ),
              const SizedBox(height: 10),
              Button(
                  padding: const EdgeInsets.all(15),
                  text: "Back to login",
                  isExpanded: true,
                  isRounded: true,
                  type: ButtonType.outline,
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
