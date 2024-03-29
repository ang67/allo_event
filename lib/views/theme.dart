import 'package:flutter/material.dart';

final ThemeData baseTheme = buildBaseTheme();

ThemeData buildBaseTheme() {
  final ThemeData base = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.orange[900],
      accentColor: Colors.greenAccent[700],
      fontFamily: null,
      accentIconTheme: IconThemeData(color: Colors.orange[900]),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87),
        headline2: TextStyle(
            fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black87),
        bodyText1: TextStyle(fontSize: 17.0, color: Colors.black54),
        bodyText2: TextStyle(fontSize: 13.5, color: Colors.black54),
      )
      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.

      );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}
