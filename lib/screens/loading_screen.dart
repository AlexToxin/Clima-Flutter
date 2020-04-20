import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
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

  void getCurrentLocationData() async {
    await _location.getCurrentLocationFromGeolocator();

    NetworkHelper networkHelper = NetworkHelper(
        url: 'https://api.openweathermap.org/data/2.5/weather?lat=' +
            _location.latitude.toString() +
            '&lon=' +
            _location.longitude.toString() +
            '&appid=$apiKey');

    var data = await networkHelper.getData();
  }
}
