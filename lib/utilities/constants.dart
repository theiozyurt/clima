import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const kTempTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sixtyfour',
  color: Color(0xFFFFE5EC),
);
const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sixtyfour',
);
const kMessageTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Almendra',
  color: Color(0xFFFFE5EC),
);
const kButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Sixtyfour',
  color: Color(0xFFEEF0F2),
);

const kTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: Color(0xFFEEF0F2),
  icon: Icon(
    Icons.location_city,
    size: 20.0,
    color: Color(0xFFEEF0F2),
  ),
  hintText: 'Please Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide.none,
  ),
);
