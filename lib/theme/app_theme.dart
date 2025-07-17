import 'package:certain_salon/theme/custom_theme.dart';
import 'package:certain_salon/theme/light_theme.dart';
import 'package:flutter/material.dart';

enum ThemeType { light, dark }

ThemeData get theme => AppTheme.theme;
CustomTheme get customTheme => AppTheme.customTheme;

class AppTheme {
  static ThemeType themeType = ThemeType.light;
  static TextDirection textDirection = TextDirection.rtl;

  static ThemeData theme = getTheme();
  static CustomTheme customTheme = getCustomTheme();

  static ThemeData getTheme([ThemeType? themeType]) {
    return lightTheme;
  }

  static CustomTheme getCustomTheme([ThemeType? themeType]) {
    return CustomTheme.lightCustomTheme;
  }


// ignore_for_file: prefer_const_constructors
  static ThemeData plantLightTheme = createTheme(
    ColorScheme.fromSeed(
      seedColor: Color(0xff009900),
      primary: Colors.green.shade600,
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff08c002),
      error: Color(0xffFF0000),
      surface: Color(0xffffffff),
      onSurface: Color(0xffffffff),
    ),
  );


  static ThemeData createTheme(ColorScheme colorScheme) {
   /*  if (themeType != ThemeType.light) {
      return lightTheme.copyWith(
        colorScheme: colorScheme,
      );
    } */
    return lightTheme.copyWith(colorScheme: colorScheme);
  }
 
}
