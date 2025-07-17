// ignore_for_file: prefer_generic_function_type_aliases

import 'dart:ui';

import 'package:certain_salon/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum CustomTextType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class CustomTextStyle {
  

  static final Map<int, FontWeight> _defaultFontWeight = {
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w300,
    500: FontWeight.w400,
    600: FontWeight.w500,
    700: FontWeight.w600,
    800: FontWeight.w700,
    900: FontWeight.w800,
  };

  static final Map<CustomTextType, double> _defaultTextSize = {
    CustomTextType.displayLarge: 57,
    CustomTextType.displayMedium: 45,
    CustomTextType.displaySmall: 36,
    CustomTextType.headlineLarge: 32,
    CustomTextType.headlineMedium: 28,
    CustomTextType.headlineSmall: 26,
    CustomTextType.titleLarge: 22,
    CustomTextType.titleMedium: 16,
    CustomTextType.titleSmall: 14,
    CustomTextType.labelLarge: 14,
    CustomTextType.labelMedium: 12,
    CustomTextType.labelSmall: 11,
    CustomTextType.bodyLarge: 16,
    CustomTextType.bodyMedium: 14,
    CustomTextType.bodySmall: 12,
  };

  static final Map<CustomTextType, int>  _defaultTextFontWeight = {
    CustomTextType.displayLarge: 500,
    CustomTextType.displayMedium: 500,
    CustomTextType.displaySmall: 500,
    CustomTextType.headlineLarge: 500,
    CustomTextType.headlineMedium: 500,
    CustomTextType.headlineSmall: 500,
    CustomTextType.titleLarge: 500,
    CustomTextType.titleMedium: 500,
    CustomTextType.titleSmall: 500,
    CustomTextType.labelLarge: 600,
    CustomTextType.labelMedium: 600,
    CustomTextType.labelSmall: 600,
    CustomTextType.bodyLarge: 500,
    CustomTextType.bodyMedium: 500,
    CustomTextType.bodySmall: 500,
  };

  static final Map<CustomTextType, double> _defaultLetterSpacing = {
    CustomTextType.displayLarge: -0.25,
    CustomTextType.displayMedium: 0,
    CustomTextType.displaySmall: 0,
    CustomTextType.headlineLarge: -0.2,
    CustomTextType.headlineMedium: -0.15,
    CustomTextType.headlineSmall: 0,
    CustomTextType.titleLarge: 0,
    CustomTextType.titleMedium: 0.1,
    CustomTextType.titleSmall: 0.1,
    CustomTextType.labelLarge: 0.1,
    CustomTextType.labelMedium: 0.5,
    CustomTextType.labelSmall: 0.5,
    CustomTextType.bodyLarge: 0.5,
    CustomTextType.bodyMedium: 0.25,
    CustomTextType.bodySmall: 0.4,
  };

  static Map<int, FontWeight> get defaultFontWeight => _defaultFontWeight;

  static Map<CustomTextType, double> get defaultTextSize => _defaultTextSize;

  static Map<CustomTextType, int> get defaultTextFontWeight => _defaultTextFontWeight;

  static Map<CustomTextType, double> get defaultLetterSpacing => _defaultLetterSpacing;

  
  


  static TextStyle getStyle(
      {TextStyle? textStyle,
      int? fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    double? finalFontSize =
        fontSize ?? (textStyle == null ? 40 : textStyle.fontSize);

    Color finalColor = color ?? theme.colorScheme.onSurface;
    finalColor = xMuted
        ? finalColor.withAlpha(160)
        : (muted ? finalColor.withAlpha(200) : finalColor);

    return TextStyle(
        fontSize: finalFontSize,
        fontWeight: _defaultFontWeight[fontWeight],
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  // Material Design 3
  static TextStyle displayLarge(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.displayLarge],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.displayLarge],
        fontWeight: _defaultTextFontWeight[CustomTextType.displayLarge],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle displayMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.displayMedium],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.displayMedium],
        fontWeight: _defaultTextFontWeight[CustomTextType.displayMedium],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle displaySmall(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.displaySmall],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.displaySmall],
        fontWeight: _defaultTextFontWeight[CustomTextType.displaySmall],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle headlineLarge(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.headlineLarge],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.headlineLarge],
        fontWeight: _defaultTextFontWeight[CustomTextType.headlineLarge],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle headlineMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.headlineMedium],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.headlineMedium],
        fontWeight: _defaultTextFontWeight[CustomTextType.headlineMedium],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle headlineSmall(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.headlineSmall],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.headlineSmall],
        fontWeight: _defaultTextFontWeight[CustomTextType.headlineSmall],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle titleLarge(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.titleLarge],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.titleLarge],
        fontWeight: _defaultTextFontWeight[CustomTextType.titleLarge],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle titleMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.titleMedium],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.titleMedium],
        fontWeight: _defaultTextFontWeight[CustomTextType.titleMedium],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle titleSmall(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.titleSmall],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.titleSmall],
        fontWeight: _defaultTextFontWeight[CustomTextType.titleSmall],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle labelLarge(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.labelLarge],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.labelLarge],
        fontWeight: _defaultTextFontWeight[CustomTextType.labelLarge],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle labelMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.labelMedium],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.labelMedium],
        fontWeight: _defaultTextFontWeight[CustomTextType.labelMedium],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle labelSmall(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.labelSmall],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.labelSmall],
        fontWeight: _defaultTextFontWeight[CustomTextType.labelSmall],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle bodyLarge(
      {TextStyle? textStyle,
      int? fontWeight,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.bodyLarge],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.bodyLarge],
        fontWeight: fontWeight ?? _defaultTextFontWeight[CustomTextType.bodyLarge],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle bodyMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.bodyMedium],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.bodyMedium],
        fontWeight: _defaultTextFontWeight[CustomTextType.bodyMedium],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle bodySmall(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double? wordSpacing,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[CustomTextType.bodySmall],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
            letterSpacing ?? _defaultLetterSpacing[CustomTextType.bodySmall],
        fontWeight: _defaultTextFontWeight[CustomTextType.bodySmall],
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  
}
