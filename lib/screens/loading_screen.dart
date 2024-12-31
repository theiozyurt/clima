import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.low,
  distanceFilter: 100,
);

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    print(position);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
