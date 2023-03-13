import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(0xFFeb5e28, <int, Color>{
            50: Color(0xfffdefea),
            100: Color(0xfffbdfd4),
            200: Color(0xfff9cfbf),
            300: Color(0xfff7bfa9),
            400: Color(0xfff5af94),
            500: Color(0xfff39e7e),
            600: Color(0xFFf18e69),
            700: Color(0xFFef7e53),
            800: Color(0xFFed6e3e),
            900: Color(0xFFeb5e28),
          })).copyWith(background: const Color(0xfffffcf2), brightness: Brightness.light)
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff252422), foregroundColor: Colors.white),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(0xff252422, <int, Color>{
          50: Color(0xffe9e9e9),
          100: Color(0xffd3d3d3),
          200: Color(0xffbebdbd),
          300: Color(0xffa8a7a7),
          400: Color(0xff929291),
          500: Color(0xff7c7c7a),
          600: Color(0xff666664),
          700: Color(0xff51504e),
          800: Color(0xff3b3a38),
          900: Color(0xff252422),
      }),).copyWith(background: const Color(0xff403d39), brightness: Brightness.dark)
  );
}