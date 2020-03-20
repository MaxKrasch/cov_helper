import 'package:flutter/material.dart';
import 'package:helperapp/screens/main_screen.dart';
import 'package:helperapp/screens/profil_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(),
          Divider(),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              'Profil',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfilScreen(),
              ));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'Hauptseite',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MainScreen(),
              ));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'Impressum',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
