// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const PRIMARY_COLOR = Color.fromRGBO(7, 28, 145, 0.95);
// ignore: constant_identifier_names
const SECONDARY_COLOR = Color.fromRGBO(165, 193, 199, 1);

ThemeData darkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
      primaryColor: const Color.fromRGBO(7, 28, 145, 0.95),
      splashColor: const Color.fromRGBO(51, 182, 161, 1),
      indicatorColor: const Color(0xFF807A6B),
      accentColor: const Color.fromARGB(255, 24, 83, 179),
      primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
        color: Colors.green,
        size: 20,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(51, 182, 161, 1),
        ),
        headline6: TextStyle(
          fontSize: 10.0,
          fontStyle: FontStyle.italic,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        bodyText2: TextStyle(
          fontSize: 8.0,
          fontFamily: 'Hind',
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      cursorColor: const Color.fromRGBO(51, 182, 161, 1),
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(7, 28, 145, 0.95),
      ));
}

ThemeData lightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    splashColor: const Color.fromRGBO(51, 182, 161, 1),
    brightness: Brightness.dark,
    indicatorColor: const Color.fromARGB(255, 255, 186, 10),
    primaryColor: const Color.fromRGBO(51, 182, 161, 1),
    accentColor: const Color.fromARGB(255, 0, 0, 0),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(51, 182, 161, 1),
      ),
      headline6: TextStyle(
        fontSize: 10.0,
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      bodyText1: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Georgia',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      bodyText2: TextStyle(
        fontSize: 8.0,
        fontFamily: 'Hind',
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    cursorColor: const Color.fromRGBO(7, 28, 145, 0.95),
  );
}
