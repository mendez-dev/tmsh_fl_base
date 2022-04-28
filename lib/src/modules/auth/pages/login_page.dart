import 'package:base/src/components/form.dart';
import 'package:base/src/modules/auth/components/buttons.dart';
import 'package:base/src/modules/auth/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final TextEditingController emailController = TextEditingController(text: 'eve.holt@reqres.in');
  final TextEditingController passwordController = TextEditingController(text: 'cityslicka');

  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state.onSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'home', (route) => false);
          }

          if (state.onError) {
            Fluttertoast.showToast(msg: state.message);
          }
        },
        builder: (BuildContext context, AuthState state) {
          BlocProvider.of<AuthBloc>(context).add(SetScreenSizeEvent(
              windowWidth: MediaQuery.of(context).size.width,
              windowHeight: MediaQuery.of(context).size.height));

          return Stack(
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
                              "My movie app",
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
                              "Cinema in the palm of your hand.",
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
                padding: const EdgeInsets.all(20),
                width: state.loginWidth,
                height: state.loginHeight,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1000),
                transform: Matrix4.translationValues(
                    state.loginXOffset, state.loginYOffset, 1),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(state.pageState == 2 ? 0.7 : 1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 20),
                                ),
                                InputText(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    validator: (String? value) {
                                      if (value == '' || value == null) {
                                        return 'this field is required';
                                      }

                                      if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                        return 'enter a valid email';
                                      }
                                    },
                                    label: "Email",
                                    icon: FontAwesomeIcons.at,
                                    type: InputTextStyle.circularBorder),
                                InputText(
                                    password: true,
                                    controller: passwordController,
                                    validator: (String? value) {
                                      if (value == '' || value == null) {
                                        return 'this field is required';
                                      }
                                    },
                                    label: "Password",
                                    icon: FontAwesomeIcons.key,
                                    type: InputTextStyle.circularBorder)
                              ],
                            ),
                            Column(
                              children: [
                                if (state.loading) ...[
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                ] else ...[
                                  LoginButton(
                                      onTap: () {
                                        if (!formKey.currentState!.validate()) {
                                          return;
                                        }
                                        BlocProvider.of<AuthBloc>(context).add(
                                            LoginEvent(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text));
                                      },
                                      text: "Login"),
                                ],
                                const SizedBox(height: 10),
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
