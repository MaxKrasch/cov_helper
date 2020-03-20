import 'package:flutter/material.dart';
import 'package:helperapp/components/constants.dart';
import 'package:helperapp/screens/main_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HilfeAnbietenPage extends StatefulWidget {
  @override
  _HilfeAnbietenPageState createState() => _HilfeAnbietenPageState();
}

class _HilfeAnbietenPageState extends State<HilfeAnbietenPage> {
  String nutzerIDHilfe = MainScreen.uuid;
  double coordLatitudeHilfe = MainScreen.lati;
  double coordLongitudeHilfe = MainScreen.longi;
  int zipHilfe;
  String textHilfe;
  int uhrZeitHilfe = MainScreen.currentTime;

  //Angebotobjekt erstellen
  List<Angebot> angebothinzu() {
    var newAngebot = Angebot(nutzerIDHilfe, coordLatitudeHilfe,
        coordLongitudeHilfe, zipHilfe, textHilfe, uhrZeitHilfe);
    setState(() {
      AngebotListe.add(newAngebot);
    });

    /*
    //Angebotliste sortieren nach Uploaduhrzeit
    for (int i = 0; i < AngebotListe.length; i++) {
      for (int j = 0; j < AngebotListe.length; j++) {
        if (int.parse(AngebotListe[i].uhrZeit) <
            int.parse(AngebotListe[j].uhrZeit)) {
          Angebot x;
          x = AngebotListe[i];
          AngebotListe[i] = AngebotListe[j];
          AngebotListe[j] = x;
        }
      }
    }*/
    print(AngebotListe);
    return AngebotListe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hilfe anbieten'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Hilfe anbieten:',
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  textHilfe = value;
                });
                print(textHilfe);
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Welche Hilfe bieten Sie an...',
              ),
            ),
          ),
          Container(
            child: Center(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    angebothinzu();
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ));
                },
                child: Text(
                  'Angebot hochladen',
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

// Klasse zur erstellung von Angeboten zum hochladen
class Angebot {
  String nutzerID;
  double latitude;
  double longitude;
  int zip;
  String text;
  int uhrZeit;

  //Konstruktor für Angebot/Hilfe die hochgeladen wird
  Angebot(
      String name, double lat, double long, int z, String t, int uhrzeitang) {
    nutzerID = name;
    latitude = lat;
    longitude = long;
    zip = z;
    text = t;
    uhrZeit = uhrzeitang;
  }
}

//Unbestimmt große Liste an Angeboten
List<Angebot> AngebotListe = [];
