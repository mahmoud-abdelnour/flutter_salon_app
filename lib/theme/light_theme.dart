import 'package:certain_salon/util/app_constants.dart';
import 'package:flutter/material.dart';


final ThemeData lightTheme = ThemeData(
    fontFamily: AppConstants.fontFamily,

    brightness: Brightness.light,
    primaryColor: Color( 0xffff93f3 ),
    primaryColorLight: Color( 0xffffccf9 ),
    primaryColorDark: Color( 0xff990088 ),
    hintColor: Color( 0xffff00e3 ),
    canvasColor: Color( 0xfffafafa ),
    scaffoldBackgroundColor:  Color( 0xffffe5fc ),
    cardColor: Color( 0xffffffff ),
    dividerColor: Color( 0x1f000000 ),
    highlightColor: Color( 0x66bcbcbc ),
    splashColor: Color( 0x66c8c8c8 ),
    unselectedWidgetColor: Color( 0x8a000000 ),
    disabledColor: Color( 0x61000000 ),
    secondaryHeaderColor: Color( 0xffffe5fc ),
    dialogBackgroundColor: Color( 0xffffffff ),
    indicatorColor: Color( 0xffff00e3 ),
  

   appBarTheme: const AppBarTheme(
      backgroundColor:  Color( 0xffffccf9 ),
      titleTextStyle: TextStyle(
          color: Color( 0xff990088 ),
          fontFamily: AppConstants.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 174, 215, 255)),
      actionsIconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255))
    ),


    iconTheme: const IconThemeData(
      color: Color( 0xdd000000 ),
      opacity: 1,
      size: 24,
    ),
    primaryIconTheme: const IconThemeData(
      color: Color( 0xff000000 ),
      opacity: 1,
      size: 24,
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: null,
      inactiveTrackColor: null,
      disabledActiveTrackColor: null,
      disabledInactiveTrackColor: null,
      activeTickMarkColor: null,
      inactiveTickMarkColor: null,
      disabledActiveTickMarkColor: null,
      disabledInactiveTickMarkColor: null,
      thumbColor: null,
      disabledThumbColor: null,
      thumbShape: null,
      overlayColor: null,
      valueIndicatorColor: null,
      valueIndicatorShape: null,
      showValueIndicator: null,
      valueIndicatorTextStyle: TextStyle(
        color: Color( 0xffffffff ),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff3d63ff),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
      ),
    ),
 

    colorScheme:const ColorScheme(
      brightness: Brightness.light,
      error:Color(0xFffba1a1a),
      errorContainer:Color(0xFffffdad6),
      inversePrimary:Color(0xFffa0cafd),
      inverseSurface:Color(0xFff2e3135),
      onError:Color(0xFffffffff),
      onErrorContainer:Color(0xFff410002),
      onInverseSurface:Color(0xFffeff0f7),
      onPrimaryFixed:Color(0xFff001d36),
      onPrimary:Color(0xFffffffff),
      onPrimaryContainer:Color(0xFff35003f),
      onPrimaryFixedVariant:Color(0xFff194975),
      onSecondary:Color(0xFffffffff),
      onSecondaryContainer:Color(0xFff101c2b),
      onSecondaryFixed:Color(0xFff101c2b),
      onSecondaryFixedVariant:Color(0xFff3b4858),
      onSurface:Color(0xFff191c20),
      onSurfaceVariant:Color(0xFff43474e),
      onTertiary:Color(0xFffffffff),
      onTertiaryContainer:Color(0xFff251431),
      onTertiaryFixed:Color(0xFff251431),
      onTertiaryFixedVariant:Color(0xFff523f5f),
      outline:Color(0xFff73777f),
      outlineVariant:Color(0xFffc3c7cf),
      primary:Color(0xFffd871e6),
      primaryContainer:Color(0xFffffd6fe),
      primaryFixed:Color(0xFffd1e4ff),
      primaryFixedDim:Color(0xFffa0cafd),
      scrim:Color(0xFff000000),
      secondary:Color(0xFff535f70),
      secondaryContainer:Color(0xFffd7e3f7),
      surfaceBright:Color(0xFfff8f9ff),
      surfaceContainer:Color(0xFffeceef4),
      surfaceContainerHigh:Color(0xFffe6e8ee),
      surfaceContainerHighest:Color(0xFffe1e2e8),
      secondaryFixed:Color(0xFffd7e3f7),
      secondaryFixedDim:Color(0xFffbbc7db),
      shadow:Color(0xFff000000),
      surface:Color(0xFfff8f9ff),
      surfaceContainerLow:Color(0xFfff2f3fa),
      surfaceContainerLowest:Color(0xFffffffff),
      surfaceDim:const Color(0xFffd8dae0),
      tertiary:Color(0xFff6b5778),
      tertiaryContainer:Color(0xFfff2daff),
      tertiaryFixed:Color(0xFfff2daff),
      tertiaryFixedDim:Color(0xFffd6bee4),
    ),



  );
