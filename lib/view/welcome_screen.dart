import 'package:flutter/material.dart';
import 'package:login_firebase/view/login_view/login_view.dart';
import 'package:login_firebase/view/register_view/email_view.dart';

import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome'.toUpperCase(),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: EmailView(),
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 250),
                  ),
                );
              },
              child: Center(child: Text('Create Acount')),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: LogInScreen(),
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: Duration(milliseconds: 250),
                  ),
                );
              },
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInScreen(),
                        ));
                  },
                  child: Text('I Already have acount')),
            )
          ],
        ),
      ),
    );
  }
}
