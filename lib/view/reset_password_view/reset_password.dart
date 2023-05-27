import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/bloc/auth_bloc.dart';

import '../../controller/controller_email_password.dart';

void ResetPasswordView(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text('ResetPassword'),
                  TextField(
                    controller: eamilController,
                    //maxLength: 8,
                    decoration: InputDecoration(
                      labelText: "Your email",
                      prefixIcon: Icon(
                        Icons.email,
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthResetPasswordEvent(
                                email: eamilController.text));
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                      title: Text(
                                          'An Email your password recover link was send '),
                                    ));
                          },
                          child: Text('Send'));
                    },
                  )
                ],
              ),
            ),
          ));
}
