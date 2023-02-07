import 'dart:ffi';

import 'package:flutter/material.dart';

class CustumTheme {
  static const Color grey = Color(0xFFC3C3C3);
  static const Color Teal = Color(0xFF199898);
  static const Color BgightTeal = Color(0xFFCEE0E0);

  static ThemeData getTheme() {
    Map<String, double> fontSize = {
      'very small': 10,
      'small': 15,
      'medium': 20,
      'big medium': 25,
      'big': 30,
      'extra big': 42.5
    };
    return ThemeData(
        primaryColor: Teal,
        fontFamily: 'Inder',
        textTheme: TextTheme(
          displayLarge:
              TextStyle(color: Colors.white, fontSize: fontSize['extra big']),
          headlineLarge:
              TextStyle(color: Colors.black, fontSize: fontSize['big']),
          displayMedium:
              TextStyle(color: Colors.black, fontSize: fontSize['big medium']),
          headlineMedium:
              TextStyle(color: Colors.black, fontSize: fontSize['medium']),
          displaySmall:
              TextStyle(color: Colors.black, fontSize: fontSize['small']),
          headlineSmall:
              TextStyle(color: Colors.black, fontSize: fontSize['very small']),
          headline1:
              TextStyle(color: Colors.white, fontSize: fontSize['medium']),
          headline2:
              TextStyle(color: Colors.teal, fontSize: fontSize['medium']),
          headline3:
              TextStyle(color: Colors.white, fontSize: fontSize['very small']),
        ));
  }
}
