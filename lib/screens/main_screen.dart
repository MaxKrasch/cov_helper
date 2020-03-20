import 'package:flutter/material.dart';
import 'package:helperapp/components/drawer.dart';
import 'package:helperapp/screens/hilfe_anbieten.dart';
import 'package:helperapp/screens/hilfe_anfordern.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:geocoder/geocoder.dart';
import 'package:helperapp/components/networkhelper.dart';

class MainScreen extends StatefulWidget {
  static int currentTime;
  static String uuid;
  static double lati;
  static double longi;
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    //Location bekommen
    getLocation();

    //UUID
    MainScreen.uuid = Uuid().v1();
    print(MainScreen.uuid);

    //Uhrzeit bekommen
    getTime();
    print(MainScreen.currentTime);

    //Postleitzahl bekommen
    // getZip();
  }

  //get Postleitzahl
  //void getZip() async {
  //final coordinates = new Coordinates(1.10, 45.50);
  // var addresses =
  //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
  // var first = addresses.first;
  // print("${first.featureName} : ${first.addressLine}");
  //}

  //uhrzeit bekommen
  void getTime() {
    MainScreen.currentTime = DateTime.now().millisecondsSinceEpoch;
  }

  //geolocator
  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    MainScreen.lati = position.latitude;
    MainScreen.longi = position.longitude;
    print(position);
  }

  NetworkHelper networkHelper =
      NetworkHelper('http://34.67.229.223/request/84453');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Column(
        children: <Widget>[
          //Liste wird aufgefüllt
          Expanded(
            child: ListView.builder(
                itemCount: AngebotListe.length,
                itemBuilder: (context, index) {
                  return Container();
                }),
          ),
          Container(
            child: Center(
              child: FlatButton(
                onPressed: () async {
                  var jo = await NetworkHelper.getData(
                      'http://34.67.229.223/request/84453');
                  print(jo);
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
          Container(
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HilfeAnfordernPage(),
                  ));
                },
                child: Text(
                  'Hilfe anfordern',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Spartan MB',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            color: Colors.blue,
            margin: EdgeInsets.only(top: 1),
            padding: EdgeInsets.only(bottom: 20.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}

/*
Card(
child: ListTile(
leading: Text('${AngebotListe[index].longitude}'),
title: Text('${AngebotListe[index].uhrZeit}'),
trailing: Text('${AngebotListe[index].latitude}'),
),
);
*/

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  static Future getData(url) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
