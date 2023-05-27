import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_firebase/controller/controller_email_password.dart';
import 'package:login_firebase/view/register_view/password_view.dart';
import 'package:page_transition/page_transition.dart';

class EmailView extends StatelessWidget {
  const EmailView({super.key});

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
            Text('Insert you Email'),
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
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context)=>PasswordView()));
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
