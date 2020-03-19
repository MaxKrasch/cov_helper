import 'package:flutter/material.dart';
import 'package:helperflutter/components/drawer.dart';
import 'package:helperflutter/screens/hilfe_anbieten.dart';
import 'package:helperflutter/screens/hilfe_anforden.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: Text(
                'Hier werden die hochgeladenen angebote angezeigt!',
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
            ),
          ),
          Container(
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HilfeAnbietenPage(),
                  ));
                },
                child: Text(
                  'Hilfe anbieten',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Spartan MB',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            color: Colors.blue,
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(bottom: 20.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
