import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/bloc/auth_bloc.dart';
import 'package:login_firebase/controller/controller_email_password.dart';

import '../../home_view/home_page.dart';
import '../reset_password_view/reset_password.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool visiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLogedInState) {
          return HomePage();
        }
        if (state is AuthLogedOutState) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text('Log In'),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: eamilController,
                    // maxLength: 8
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black45,
                      ),
                      suffixIcon: Icon(
                        Icons.account_box,
                        color: Colors.black45,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: PasswordController,
                    //maxLength: 8,
                    obscureText: visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Your Password",
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.black45,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visiblePassword = !visiblePassword;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                        color: Colors.black45,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      hintText: "Enter Firstname",
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(children: [
                      state.isloading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(AuthLogInEvent(
                                    email: eamilController.text,
                                    password: PasswordController.text));
                              },
                              child: Text('Log In'),
                            ),
                    ]),
                  ),
                  GestureDetector(
                      onTap: () {
                        ResetPasswordView(context);
                      },
                      child: Text('Forgot your password'))
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
