
import 'package:certain_salon/util/app_constants.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
final ThemeData lightTheme = ThemeData(
  fontFamily: AppConstants.fontFamily,

  /// Brightness
  brightness: Brightness.light,

  /// Primary Color
  primaryColor: Color(0xFffe91e63),
  scaffoldBackgroundColor: Color(0xffffffff),
  canvasColor: Colors.transparent,

  /// AppBar Theme
  appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 172, 93, 139),
      titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 236, 213, 221),
          fontFamily: AppConstants.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 174, 215, 255)),
      actionsIconTheme:
          IconThemeData(color: Color.fromARGB(255, 255, 255, 255))),

  /// Card Theme
  cardTheme: CardTheme(color: Color(0xfff0f0f0)),
  cardColor: Color(0xfff0f0f0),

  textTheme: TextTheme(titleLarge: TextStyle(color: Color(0xFFE0E0E0))),

  /// Floating Action Theme
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xff3C4EC5),
      splashColor: Color(0xffeeeeee).withAlpha(100),
      highlightElevation: 8,
      elevation: 4,
      focusColor: Color(0xff3C4EC5),
      hoverColor: Color(0xff3C4EC5),
      foregroundColor: Color(0xffeeeeee)),

  /// Divider Theme
  dividerTheme: DividerThemeData(color: Color(0xffe8e8e8), thickness: 1),
  dividerColor: Color(0xffe8e8e8),

  /// Bottom AppBar Theme
  bottomAppBarTheme: BottomAppBarTheme(color: Color(0xffeeeeee), elevation: 2),

  /// Tab bar Theme
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: Color(0xff495057),
    labelColor: Color(0xff3d63ff),
    indicatorSize: TabBarIndicatorSize.label,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
    ),
  ),

  /// CheckBox theme
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Color(0xffeeeeee)),
    fillColor: WidgetStateProperty.all(Color(0xff3C4EC5)),
  ),

  /// Radio theme
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.all(Color(0xff3C4EC5)),
  ),

  ///Switch Theme
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((state) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
        WidgetState.selected,
      };
      if (state.any(interactiveStates.contains)) {
        return Color(0xffabb3ea);
      }
      return null;
    }),
    thumbColor: WidgetStateProperty.resolveWith((state) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
        WidgetState.selected,
      };
      if (state.any(interactiveStates.contains)) {
        return Color(0xff3C4EC5);
      }
      return null;
    }),
  ),

  /// Slider Theme
  sliderTheme: SliderThemeData(
    activeTrackColor: Color(0xff3d63ff),
    inactiveTrackColor: Color(0xff3d63ff).withAlpha(140),
    trackShape: RoundedRectSliderTrackShape(),
    trackHeight: 4.0,
    thumbColor: Color(0xff3d63ff),
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
    tickMarkShape: RoundSliderTickMarkShape(),
    inactiveTickMarkColor: Colors.red[100],
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
    valueIndicatorTextStyle: TextStyle(
      color: Color(0xffeeeeee),
    ),
  ),

  /// Other Colors
  splashColor: Colors.white.withAlpha(100),
  indicatorColor: Color(0xffeeeeee),
  highlightColor: Color(0xffeeeeee),

  /*    colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xff3C4EC5), brightness: Brightness.light)
        .copyWith(surface: Color(0xffffffff))
        .copyWith(error: Color(0xfff0323c)), */

  colorScheme: ColorScheme(
    /* brightness: Brightness.light,
      primary: const Color(0xFF01684B),
      onPrimary: const Color.fromARGB(255, 164, 220, 204),
      secondary: const Color(0xFFEEFCF8),
      onSecondary: const Color(0xFFEFE6FE),
      error: Colors.redAccent,
      onError: Colors.redAccent,
      surface: Colors.white,
      onSurface:  const Color(0xFF002349),
      shadow: Colors.grey[300], */

    brightness: Brightness.light,
    error: Color(0xFffba1a1a),
    errorContainer: Color(0xFffffdad6),
    inversePrimary: Color(0xFffffb2be),
    inverseSurface: Color(0xFff382e2f),
    onError: Color(0xFffffffff),
    onErrorContainer: Color(0xFff410002),
    onInverseSurface: Color(0xFfffeedee),
    onPrimary: Color(0xFffffffff),
    onPrimaryContainer: Color(0xFff400014),
    onSecondary: Color(0xFffffffff),
    onSecondaryContainer: Color(0xFff2c1519),
    onSurface: Color(0xfff22191a),
    onSurfaceVariant: Color(0xFff524345),
    onTertiary: Color(0xFffffffff),
    onTertiaryContainer: Color(0xFff2b1700),
    outline: Color(0xFff847375),
    outlineVariant: Color(0xFffd6c2c3),
    primary: Color(0xFffe91e63),
    primaryContainer: Color(0xFffffd9de),
    scrim: Color(0xFff000000),
    secondary: Color(0xFff75565b),
    secondaryContainer: Color(0xFffffd9de),
    shadow: Color(0xFff000000),
    surface: Color(0xFfffff8f7),
    surfaceContainerHighest: Color(0xffff0dee0),
    surfaceTint: Color(0xFff8e4957),
    tertiary: Color(0xfff795831),
    tertiaryContainer: Color(0xfffffddba),
    tertiaryFixed: Color.fromARGB(255, 226, 244, 217),
    tertiaryFixedDim:  Color.fromARGB(255, 3, 127, 26),
    
  ),
);


