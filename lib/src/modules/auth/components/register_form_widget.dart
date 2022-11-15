import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/buttons_widget.dart';
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
              const ButtonWidget(
                padding: EdgeInsets.all(15),
                text: "Crate account",
                isExpanded: true,
                isRounded: true,
              ),
              const SizedBox(height: 10),
              ButtonWidget(
                  padding: const EdgeInsets.all(15),
                  text: "Back to login",
                  isExpanded: true,
                  isRounded: true,
                  type: ButtonType.outlined,
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
