import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location _location = Location();

  int weatherId;
  double temperature;
  String city;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void getCurrentLocation() async {
    await _location.getCurrentLocationFromGeolocator();
    String data = await _location.getData();

    var decodedData = json.decode(data);

    weatherId = decodedData['weather'][0]['id'];
    temperature = decodedData['main']['temp'];
    city = decodedData['name'];
  }
}
