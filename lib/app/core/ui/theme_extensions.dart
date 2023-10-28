import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  Color get errorColor => Colors.red;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color? get buttonColor => Theme.of(this).bottomAppBarTheme.color;
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get titleStyle => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Theme.of(this).primaryColor,
      );
}
