import 'package:flutter/material.dart';
import 'package:helperapp/screens/login_reg_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginRegScreen(),
    );
  }
}
