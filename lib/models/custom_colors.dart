import 'package:flutter/material.dart';

/// Map of customized colors that are not present in Material Color

Map<int, Color> primaryThemeColor = {
  50: const Color.fromRGBO(2, 62, 138, .1),
  100: const Color.fromRGBO(2, 62, 138, .2),
  200: const Color.fromRGBO(2, 62, 138, .3),
  300: const Color.fromRGBO(2, 62, 138, .4),
  400: const Color.fromRGBO(2, 62, 138, .5),
  500: const Color.fromRGBO(2, 62, 138, .6),
  600: const Color.fromRGBO(2, 62, 138, .7),
  700: const Color.fromRGBO(2, 62, 138, .8),
  800: const Color.fromRGBO(2, 62, 138, .9),
  900: const Color.fromRGBO(2, 62, 138, 1),
};

Map<int, Color> accentThemeColor = {
  50: const Color.fromRGBO(0, 119, 182, .1),
  100: const Color.fromRGBO(0, 119, 182, .2),
  200: const Color.fromRGBO(0, 119, 182, .3),
  300: const Color.fromRGBO(0, 119, 182, .4),
  400: const Color.fromRGBO(0, 119, 182, .5),
  500: const Color.fromRGBO(0, 119, 182, .6),
  600: const Color.fromRGBO(0, 119, 182, .7),
  700: const Color.fromRGBO(0, 119, 182, .8),
  800: const Color.fromRGBO(0, 119, 182, .9),
  900: const Color.fromRGBO(0, 119, 182, 1),
};

Map<int, Color> isCompletedThemeColor = {
  50: const Color.fromRGBO(202, 240, 248, .1),
  100: const Color.fromRGBO(202, 240, 248, .2),
  200: const Color.fromRGBO(202, 240, 248, .3),
  300: const Color.fromRGBO(202, 240, 248, .4),
  400: const Color.fromRGBO(202, 240, 248, .5),
  500: const Color.fromRGBO(202, 240, 248, .6),
  600: const Color.fromRGBO(202, 240, 248, .7),
  700: const Color.fromRGBO(202, 240, 248, .8),
  800: const Color.fromRGBO(202, 240, 248, .9),
  900: const Color.fromRGBO(202, 240, 248, 1),
};

Map<int, Color> isNotCompletedThemeColor = {
  50: const Color.fromRGBO(144, 244, 239, .1),
  100: const Color.fromRGBO(144, 244, 239, .2),
  200: const Color.fromRGBO(144, 244, 239, .3),
  300: const Color.fromRGBO(144, 244, 239, .4),
  400: const Color.fromRGBO(144, 244, 239, .5),
  500: const Color.fromRGBO(144, 244, 239, .6),
  600: const Color.fromRGBO(144, 244, 239, .7),
  700: const Color.fromRGBO(144, 244, 239, .8),
  800: const Color.fromRGBO(144, 244, 239, .9),
  900: const Color.fromRGBO(144, 244, 239, 1),
};

MaterialColor primaryTheme = MaterialColor(0xFF023E8A, primaryThemeColor);
MaterialColor accentTheme = MaterialColor(0xFF0077B6, accentThemeColor);
MaterialColor isCompletedTheme = MaterialColor(0xFFCAF0F8, isCompletedThemeColor);
MaterialColor isNotCompletedTheme = MaterialColor(0xFF90E0EF, isNotCompletedThemeColor);
