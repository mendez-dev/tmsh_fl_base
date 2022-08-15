import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/buttons.dart';
import '../bloc/bloc/auth_bloc.dart';

class WelcomePageWidget extends StatelessWidget {
  const WelcomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => BlocProvider.of<AuthBloc>(context)
                  .add(ChangePageStateEvent(0)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: state.headingTop),
                    child: Text(
                      "Mini POS",
                      style: TextStyle(
                          color: state.pageState == 0
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          fontSize: 28),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 32),
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "Impulsa tu negocio desde la palma de tu mano.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: state.pageState == 0
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Center(
                child: SvgPicture.asset("assets/svg/welcome.svg"),
              ),
            ),
            Container(
              // margin: const EdgeInsets.all(32),
              padding: const EdgeInsets.all(20),
              child: Button(
                isRounded: true,
                isExpanded: true,
                padding: const EdgeInsets.all(15),
                text: "Empezar",
                onTap: () {
                  if (state.pageState != 0) {
                    BlocProvider.of<AuthBloc>(context)
                        .add(ChangePageStateEvent(0));
                  } else {
                    BlocProvider.of<AuthBloc>(context)
                        .add(ChangePageStateEvent(1));
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
