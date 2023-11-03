import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/colors_extensions.dart';

extension ThemeExtensions on BuildContext {
  Color get errorColor => Colors.red;
  Color get primaryColor => ColorsExtensions().primaryColors;
  Color get infoColor => ColorsExtensions().infoColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color? get buttonColor => Theme.of(this).bottomAppBarTheme.color;
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get titleStyle => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Theme.of(this).primaryColor,
      );
}
