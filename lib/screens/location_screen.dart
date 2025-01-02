import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({required this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature;
  int? condition;
  String? cityName;
  String? weatherMessage;
  String? weatherIcon;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  WeatherModel get_otherstuff = WeatherModel();

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      cityName = 'Unknown';
      weatherMessage = 'We couldn\'t access to the location data';
      weatherIcon = 'Error!';
      return;
    }
    setState(() {
      condition = weatherData['id'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherIcon = get_otherstuff.getWeatherIcon(condition!);
      cityName = weatherData['name'];
      weatherMessage = get_otherstuff.getMessage(temperature!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData =
                          await get_otherstuff.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      print(typedName);
                      if (typedName != null) {
                        var weatherData =
                            await get_otherstuff.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(130.0, 0, 10.0, 200.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "$temperature°",
                      style: kTempTextStyle,
                    ),
                    Text(
                      get_otherstuff.getWeatherIcon(condition!),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.0, 0, 100.0, 100.0),
                child: Text(
                  '$weatherMessage \n  in $cityName',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
