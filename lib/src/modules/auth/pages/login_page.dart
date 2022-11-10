import 'package:base/src/modules/settings/repositories/preferences/preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/network/network_repository.dart';
import '../bloc/bloc/auth_bloc.dart';
import '../components/login_form_widget.dart';
import '../components/register_form_widget.dart';
import '../components/welcome_page_widget.dart';
import '../repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (BuildContext context) => AuthRepositoryImpl(
          networkRepository: RepositoryProvider.of<NetworkRepository>(context)),
      child: BlocProvider<AuthBloc>(
        create: (BuildContext context) => AuthBloc(
            preferencesRepository:
                RepositoryProvider.of<PreferencesRepository>(context),
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: const LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          // logger.v(MediaQuery.of(context).viewInsets.bottom);
          if (state.isLoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'home', (route) => false);
          }
        },
        builder: (BuildContext context, AuthState state) {
          // Actualizamos el tamaño de la pantalla cada vez que se redibuja
          BlocProvider.of<AuthBloc>(context).add(SetScreenSizeEvent(
              windowWidth: MediaQuery.of(context).size.width,
              windowHeight: MediaQuery.of(context).size.height,
              keyboardHeight: MediaQuery.of(context).viewInsets.bottom));

          return WillPopScope(
            onWillPop: () =>
                _onWillPop(pageState: state.pageState, context: context),
            child: Stack(
              children: [
                AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 1000),
                  color: state.pageState == 0
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).primaryColorDark,
                  child: const WelcomePageWidget(),
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
                  transform: _loginTransform(state, context),
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
                    transform: _registerTransform(state, context),
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

  Future<bool> _onWillPop(
      {required int pageState, required BuildContext context}) async {
    if (pageState == 2) {
      BlocProvider.of<AuthBloc>(context).add(ChangePageStateEvent(1));
      return false;
    } else if (pageState == 1) {
      BlocProvider.of<AuthBloc>(context).add(ChangePageStateEvent(0));
      return false;
    }

    return true;
  }

  Matrix4 _registerTransform(AuthState state, BuildContext context) {
    if (state.registerYOffset == 0) {
      return Matrix4.translationValues(
          0,
          state.pageState == 2
              ? MediaQuery.of(context).size.height - state.keyboardHeight
              : MediaQuery.of(context).size.height,
          1);
    }
    return Matrix4.translationValues(
        0,
        state.pageState == 2
            ? state.registerYOffset - state.keyboardHeight
            : state.registerYOffset,
        1);
  }

  Matrix4 _loginTransform(AuthState state, BuildContext context) {
    if (state.loginYOffset == 0) {
      return Matrix4.translationValues(state.loginXOffset,
          MediaQuery.of(context).size.height - state.keyboardHeight, 1);
    }
    return Matrix4.translationValues(
        state.loginXOffset, state.loginYOffset - state.keyboardHeight, 1);
  }
}
