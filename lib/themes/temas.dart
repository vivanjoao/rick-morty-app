import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(surface: Color(0xFFEDDFB9)),
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 24, color: Colors.black),
    bodySmall: TextStyle(fontSize: 16, color: Colors.black),
    headlineMedium: TextStyle(fontSize: 24, color: Colors.white),
  ),
  dividerColor: Color(0xFFEFE7DA),
  cardColor: Color(0xFF306740),
  dividerTheme: DividerThemeData(
    color: Colors.deepOrange
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(surface: Color(0xFF073738)),
  primaryColorLight: Colors.red,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 24, color: Colors.white),
    bodySmall: TextStyle(fontSize: 16, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 16, color: Colors.white),
  ),
  dividerColor: Color(0xFFFF00A6),
  cardColor: Color(0xFF306740),
  dividerTheme: DividerThemeData(
      color: Colors.red,
  ),
);

