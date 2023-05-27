import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/auth/repositories.dart';
import 'package:login_firebase/bloc/auth_bloc.dart';
import 'package:login_firebase/home_view/home_page.dart';
import 'package:login_firebase/slpash_screen/slpash_screen.dart';
import 'package:login_firebase/view/welcome_screen.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthRepository().authStateChange,
        builder: (context, snapshot) {
          return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthLoading) {
              return SplashScreen();
            }
            if (state is AuthLogedInState) {
              return HomePage();
            }
            if (state is AuthLogedOutState) {
              return WelcomeScreen();
            }
            return Container();
          });
        });
  }
}
