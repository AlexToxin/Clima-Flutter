import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as Http;

class Location {
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      this.longitude = position.longitude;
      this.latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData() async {
    Http.Response response = await Http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');

    if (response.statusCode != 200) {
      print(response.statusCode);
      return;
    }

    print(response.body);
  }
}
