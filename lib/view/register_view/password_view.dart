import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/bloc/auth_bloc.dart';

import '../../controller/controller_email_password.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  bool visiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Insert you password'),
            TextField(
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
            SizedBox(
              height: 40,
            ),
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return Align(
                  alignment: Alignment.center,
                  child: state.isloading
                      ? CircularProgressIndicator()
                      : SizedBox(
                          height: 40,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  context.read<AuthBloc>().add(
                                        AuthRegisterEvent(
                                            email: eamilController.text,
                                            password: PasswordController.text),
                                      );
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                  ),
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ))));
            })
          ]),
        ),
      ),
    );
  }
}
