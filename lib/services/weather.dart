import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Future<dynamic> GetLocWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;
    NetWorkHelper netWorkHelper = NetWorkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude');
    var weatherData = await netWorkHelper.getData();
    return weatherData;
  }

  Future<dynamic> GetCityWeather(String CityName) async {
    NetWorkHelper netWorkHelper = NetWorkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$CityName');
    var weatherData = await netWorkHelper.getData();
    return weatherData;
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
