import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColorDark,
        appBarTheme: const AppBarTheme().copyWith(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText2: const TextStyle(
                color: primaryTextColor,
                fontSize: 16,
              ),
            ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: primaryTextColor,
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
      );
}
