import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 234, 158, 91),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 255, 245, 236),
      onSecondary: Color.fromARGB(255, 234, 158, 91),
      tertiary: Color.fromARGB(255, 165, 158, 151),
      error: Color.fromARGB(255, 248, 224, 203),
      onError: Colors.red,
      background: Color.fromARGB(255, 255, 252, 250),
      onBackground: Color.fromARGB(255, 76, 61, 48),
      surface: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 76, 61, 48),
      outline: Color.fromARGB(255, 76, 61, 48),
      outlineVariant: Color.fromARGB(255, 76, 61, 48)),
  fontFamily: 'Bitter',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 76, 61, 48),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      backgroundColor: const Color.fromARGB(255, 234, 158, 91),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color.fromARGB(255, 234, 158, 91),
    unselectedLabelColor: Color.fromARGB(255, 201, 194, 189),
    indicatorColor: Color.fromARGB(255, 234, 158, 91),
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Bitter',
    ),
  ),
);
