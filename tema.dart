import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
    // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Colors.deepPurple[800],
      accentColor: Colors.pinkAccent[600],
      // Define the default font family.
      fontFamily: 'Arial'
  );
}