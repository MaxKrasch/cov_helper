import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helperflutter/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void moveToMainScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen();
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: SpinKitDoubleBounce(
              color: Colors.blueGrey,
              size: 100.0,
            ),
          ),
          SizedBox(
            child: FlatButton(
              color: Colors.red,
              onPressed: moveToMainScreen,
            ),
          )
        ],
      ),
    );
  }
}
