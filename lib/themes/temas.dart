import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(surface: Color(0xFFEDDFB9)),
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 20, color: Colors.white),
    bodySmall: TextStyle(fontSize: 16, color: Colors.white),
  ),
  dividerColor: Color(0xFFEFE7DA),
  cardColor: Color(0xFF306740),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(surface: Color(0xFF073738)),
  primaryColorLight: Colors.red,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 24),
    bodySmall: TextStyle(fontSize: 16, color: Colors.white),
  ),
  dividerColor: Color(0xFF00A0CA),
  cardColor: Color(0xFF306740),
);
