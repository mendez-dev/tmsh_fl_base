import 'package:base/src/modules/auth/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthBloc? authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    // Verify token status
    authBloc!.add(VerifyTokenEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.loggedStatus == 1) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'login', (route) => false);
          }

          if (state.loggedStatus == 2) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'home', (route) => false);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    width: _size.width * 0.6,
                    child: Lottie.asset('assets/lotties/splash.json')),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "My movie app",
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          );
        },
      ),
    );
  }
}
