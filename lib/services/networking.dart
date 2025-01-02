import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'location.dart';

const apiKey = '785b6a1702e27432d7ddf648954cf50c';
double? latitude;
double? longitude;

class NetworkHelper {
  final String url; // We are using final String instead String?

  NetworkHelper(
      {required this.url}); //We are using the Constructor url in this.url

  Future<dynamic> getData() async {
    try {
      print('Requesting URL: $url'); //We are writing the URL for Debugging

      Response response = await get(Uri.parse(url));
      print('Status Code: ${response.statusCode}'); //Status code for Debug

      if (response.statusCode == 200) {
        String data = response.body;
        print(response.body);
        return jsonDecode(data);
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error in getData: $e');
      return null;
    }
  }
}
