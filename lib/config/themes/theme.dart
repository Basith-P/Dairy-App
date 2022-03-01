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
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText2: const TextStyle(
                color: primaryTextColor,
                fontSize: 16,
              ),
            ),
      );
}
