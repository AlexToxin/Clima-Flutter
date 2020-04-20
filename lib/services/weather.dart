import 'package:clima/utilities/constants.dart';

import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location _location = Location();
    await _location.getCurrentLocationFromGeolocator();

    NetworkHelper networkHelper = NetworkHelper(
      url:
      '$openWeatherUrl?lat=${_location.latitude}&lon=${_location
          .longitude}&appid=$apiKey&units=metric',
    );

    var weather = await networkHelper.getData();
    return weather;
  }

  Future<dynamic> getCityWeather(cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      url: '$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric',
    );

    var weather = await networkHelper.getData();
    return weather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
