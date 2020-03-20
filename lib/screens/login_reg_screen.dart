import 'package:flutter/material.dart';
import 'package:helperapp/components/rounded_button.dart';
import 'package:helperapp/screens/login_screen.dart';
import 'package:helperapp/screens/registration_screen.dart';

class LoginRegScreen extends StatefulWidget {
  @override
  _LoginRegScreenState createState() => _LoginRegScreenState();
}

class _LoginRegScreenState extends State<LoginRegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RegistrationScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
