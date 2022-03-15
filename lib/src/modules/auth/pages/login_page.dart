import 'package:base/src/components/form.dart';
import 'package:base/src/modules/auth/components/buttons.dart';
import 'package:base/src/modules/auth/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:global_configuration/global_configuration.dart';

class LoginPage extends StatelessWidget {
  
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(),
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
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
                        onTap: () => BlocProvider.of<AuthBloc>(context).add(ChangePageStateEvent(0)),
                        child: Column(
                          children: [
                            Container(
                              margin:  EdgeInsets.only(top: state.headingTop),
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
                              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: Text(
                                "Proident magna nostrud do id. Excepteur labore culpa elit officia cupidatat.",
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
                        child: LoginButton(text: "Get started", onTap: (){
                           if (state.pageState != 0) {
                            BlocProvider.of<AuthBloc>(context)
                                .add(ChangePageStateEvent(0));
                          } else {
                            BlocProvider.of<AuthBloc>(context)
                                .add(ChangePageStateEvent(1));
                          }
                        },),
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
                  transform:
                      Matrix4.translationValues(state.loginXOffset, state.loginYOffset, 1),
                  decoration:  BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity( state.pageState == 2 ? 0.7 : 1 ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text("Iniciar sesión", style: TextStyle(fontSize: 20),),
                          InputText(label: "Correo", icon: FontAwesomeIcons.at, type: InputTextType.circularBorder),
                          InputText(label: "Contraseña", icon: FontAwesomeIcons.key, type: InputTextType.circularBorder)
                        ],
                      ),
                      Column(
                        children:  [
                          const LoginButton(text: "Login"),
                          const SizedBox(height: 10),
                          if ( GlobalConfiguration().get("allow_account_creation") ) ...[
                            LoginButton(text: "Create new account", type: CustomButtomType.outline, onTap: () => BlocProvider.of<AuthBloc>(context).add(ChangePageStateEvent(2)),)
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  padding: const EdgeInsets.all(20),
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 1000),
                  transform:
                      Matrix4.translationValues(0, state.registerYOffset, 1),
                  decoration:  BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: Column(
                    children: [
                      Form(
                        
                        child: Column(
                          children:  [
                            const Text("Create new account", style: TextStyle(fontSize: 20),),
                              InputText(
                              icon: FontAwesomeIcons.at,
                              label: "Correo",
                              validator: (String? value) => "Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido",
                            ),
                             InputText(
                              validator: (String? value) => "Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido",
                              type: InputTextType.circularBorder,
                              icon: FontAwesomeIcons.at,
                              label: "Contraseña",
                            ),
                             InputText(
                               validator: (String? value) => "Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido, Campo requerido",
                              type: InputTextType.bordered,
                              icon: FontAwesomeIcons.at,
                              label: "Repetir Contraseña",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children:    [
                           const LoginButton(text: "Crate account",),
                           const SizedBox(height: 10),
                           LoginButton(text: "Back to login", type: CustomButtomType.outline, onTap: () => BlocProvider.of<AuthBloc>(context).add(ChangePageStateEvent(1)))
                        ],
                      ),
                    ],
                  )
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
