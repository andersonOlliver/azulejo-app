import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff000e55);

ThemeData theme() {
  return ThemeData(
    primaryColor: primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
    textButtonTheme: TextButtonThemeData(style: flatButtonStyle),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
  );
}

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  primary: primaryColor,
  backgroundColor: Color(0xfff5f5f5),
  minimumSize: Size(88, 36),
  textStyle: TextStyle(
    fontWeight: FontWeight.w400,
  ),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

final ButtonStyle elevatedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(primaryColor),
  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
  elevation: MaterialStateProperty.all(0),
  textStyle: MaterialStateProperty.all(
    TextStyle(
      fontWeight: FontWeight.w400,
    ),
  ),
);
