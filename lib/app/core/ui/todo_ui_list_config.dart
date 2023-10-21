import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/app/core/ui/colors_extensions.dart';

class TodoUiListConfig {
  TodoUiListConfig._();

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xff5c77ce),
        primaryColorLight: const Color(0xff5c77ce),
        textTheme: GoogleFonts.mandaliTextTheme(),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsExtensions().buttonColor,
            elevation: 0.6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
}
