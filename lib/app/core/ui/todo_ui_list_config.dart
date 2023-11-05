import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/app/core/ui/colors_extensions.dart';

class TodoUiListConfig {
  TodoUiListConfig._();

  static ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primaryColor: ColorsExtensions().buttonColor,
        primaryColorLight: ColorsExtensions().buttonColor,
        textTheme: GoogleFonts.mandaliTextTheme(),
        primaryTextTheme: TextTheme(
          headlineMedium: TextStyle(
            color: ColorsExtensions().colorWhite,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor:
                MaterialStateProperty.all(ColorsExtensions().buttonColor),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.blue;
            }),
          ),
        ),
        iconTheme: IconThemeData(
          color: ColorsExtensions().buttonColor,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorsExtensions().buttonColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: false,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          filled: false,
          floatingLabelStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            backgroundColor: Colors.transparent,
            decorationColor: Colors.transparent,
          ),
          suffixStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          suffixIconColor: Colors.black,
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          prefixStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            inherit: true,
          ),
          focusColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: ColorsExtensions().buttonColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: ColorsExtensions().primaryColors,
            ),
          ),
          isDense: true,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                color: Colors.white,
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
