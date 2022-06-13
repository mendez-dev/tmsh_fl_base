import 'package:base/src/modules/auth/bloc/bloc/auth_bloc.dart';
import 'package:base/src/modules/auth/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../components/login_form_widget.dart';
import '../components/register_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(),
      child: const LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context)
        .add(KeyboardHeightEvent(MediaQuery.of(context).viewInsets.bottom));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          // logger.v(MediaQuery.of(context).viewInsets.bottom);
        },
        builder: (BuildContext context, AuthState state) {
          BlocProvider.of<AuthBloc>(context).add(SetScreenSizeEvent(
              windowWidth: MediaQuery.of(context).size.width,
              windowHeight: MediaQuery.of(context).size.height));

          return WillPopScope(
            onWillPop: () async {
              if (state.pageState == 2) {
                BlocProvider.of<AuthBloc>(context).add(ChangePageStateEvent(1));
                return false;
              } else if (state.pageState == 1) {
                BlocProvider.of<AuthBloc>(context).add(ChangePageStateEvent(0));
                return false;
              }

              return true;
            },
            child: Stack(
              children: [
                AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 1000),
                  color: state.pageState == 0
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).primaryColorDark,
                  child: Column(
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
                                "Learn free",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Text(
                                "Proident magna nostrud do id. Excepteur labore culpa elit officia cupidatat.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: state.pageState == 0
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
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
                        child: LoginButton(
                          text: "Get started",
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
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: double.infinity,
                  height: state.keyboardHeight,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  transform: Matrix4.translationValues(
                      0,
                      MediaQuery.of(context).size.height - state.keyboardHeight,
                      1),
                ),
                AnimatedContainer(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: state.loginWidth,
                  height: state.loginHeight,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 1000),
                  transform: Matrix4.translationValues(state.loginXOffset,
                      state.loginYOffset - state.keyboardHeight, 1),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(state.pageState == 2 ? 0.7 : 1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: SizedBox(
                    height: state.loginHeight,
                    child: const SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: LoginFormWidget(),
                    ),
                  ),
                ),
                AnimatedContainer(
                    height: state.loginHeight,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 25),
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 1000),
                    transform: Matrix4.translationValues(
                        0,
                        state.pageState == 2
                            ? state.registerYOffset - state.keyboardHeight
                            : state.registerYOffset,
                        1),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: const SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: RegisterFormWindget(),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
