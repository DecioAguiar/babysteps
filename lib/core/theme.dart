//Tema das cores, fontes, e etc.
import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF7263BB);
  static const secondaryColor = Color(0xFF3E3666);
  static const backgroundColor = Color(0xFFD5CCFF);
  static const textColor = secondaryColor;

  static const String fontFamily = 'Inter';

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: fontFamily,

    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: textColor),
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColor, fontSize: 16),
      bodyMedium: TextStyle(color: textColor, fontSize: 14),
    ),


    
  );
}
