import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey =';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather?';

Location getLoc = Location();

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '${openWeatherMapURL}q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    await getLoc.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '${openWeatherMapURL}lat=${getLoc.latitude}&lon=${getLoc.longitude}&appid=$apiKey&units=metric');
    //https://api.openweathermap.org/data/2.5/weather?lat=39.42342342342342&lon=29.99605234656493&appid=785b6a1702e27432d7ddf648954cf50c&units=metric
    var weatherData = await networkHelper.getData();

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
    if (temp >= 25) {
      return 'It\'s perfect outside ☀️ ️';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'It\'s better dress warmly, it is cold outside 🥶';
    } else {
      return 'You should wear a little thick clothes at least 🧥';
    }
  }
}
