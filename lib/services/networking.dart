import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

const apiKey = '785b6a1702e27432d7ddf648954cf50c';
double? latitude;
double? longitude;

class NetworkHelper {
  String? url;

  NetworkHelper({required String url}) {}

  Future<void> getData() async {
    Response response = await get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey',
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
