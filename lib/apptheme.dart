import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(0, 0, 255, .1),
  100: const Color.fromRGBO(0, 0, 255, .2),
  200: const Color.fromRGBO(0, 0, 255, .3),
  300: const Color.fromRGBO(0, 0, 255, .4),
  400: const Color.fromRGBO(0, 0, 255, .5),
  500: const Color.fromRGBO(0, 0, 255, .6),
  600: const Color.fromRGBO(0, 0, 255, .7),
  700: const Color.fromRGBO(0, 0, 255, .8),
  800: const Color.fromRGBO(0, 0, 255, .9),
  900: const Color.fromRGBO(0, 0, 255, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF0000ff, color);

Color mainColor = const Color(0xFF0000ff);

double tinyspacing = 2;
double littlespacing = 8;
double smallspacing = 16;
double mediumspacing = 24;
double largespacing = 32;

ThemeData lightTheme =
    ThemeData(primarySwatch: colorCustom, brightness: Brightness.light);
ThemeData darkTheme =
    ThemeData(primarySwatch: colorCustom, brightness: Brightness.dark);