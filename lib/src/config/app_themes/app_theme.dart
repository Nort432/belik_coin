
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get myLight {
    return ThemeData(
      brightness: Brightness.light,
    );
  }

  static ThemeData get myDark {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}