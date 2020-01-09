
import 'package:flutter/material.dart';

class CustomTheme{
  static Color primary = colorFromHex("#07090d");
  static Color accent = colorFromHex("#456bd8");
  static Color content = colorFromHex("#16191d");
  static Color unselected = colorFromHex("#494a4e");

  static TextTheme myTextTheme = TextTheme(
    body1: TextStyle(
      color: Colors.white
    )
  );


  static Color colorFromHex(String code) {
    var str = code.substring(1, 7);
    var bigint = int.parse(str, radix: 16);
    final r = (bigint >> 16) & 255;
    final g = (bigint >> 8) & 255;
    final b = bigint & 255;
    final a = 255;
    return Color.fromARGB(a, r, g, b);
  }

}