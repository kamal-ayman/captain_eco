import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'eco_taxi_theme_extensions.dart';
import 'eco_taxi_values.dart';
import '../theme/colors.dart';
import 'light_colors.dart';

enum EcoTaxiTheme {
  light,
  dark;

  static EcoTaxiTheme fromInt(int number) => number == 0 ? EcoTaxiTheme.light : EcoTaxiTheme.dark;

  ThemeMode themeMode() => this == light ? ThemeMode.light : ThemeMode.dark;

  int toInt() => this == light ? 0 : 1;
}

class EcoTaxiThemes {
  EcoTaxiThemes._();

  static ThemeData _fromPalette(EcoTaxiColorPalette palette) {
    return ThemeData(
      scaffoldBackgroundColor: palette.background,
      useMaterial3: false,
      appBarTheme: AppBarTheme(
        backgroundColor: palette.background,
        iconTheme: IconThemeData(color: palette.text),
        elevation: 0,
        centerTitle: true,
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        backgroundColor: palette.background,
        indicatorColor: palette.text.withOpacity(EcoTaxiValues.loweredOpacity),
        labelTextStyle: WidgetStateProperty.all<TextStyle>(
          GoogleFonts.tajawalTextTheme().bodySmall!.copyWith(color: palette.text, fontWeight: FontWeight.w900),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        elevation: 0,
        backgroundColor: palette.background,
        indicatorColor: palette.text.withOpacity(EcoTaxiValues.loweredOpacity),
        selectedLabelTextStyle: GoogleFonts.tajawalTextTheme().bodySmall!.copyWith(color: palette.text, fontWeight: FontWeight.w900),
      ),
      colorScheme: ColorScheme(
        error: palette.highlight1,
        onPrimary: palette.background,
        brightness: palette.brightness,
        secondary: palette.highlight4,
        surface: palette.background,
        primary: palette.highlight4,
        onSurface: palette.text,
        onError: palette.text,
        onSecondary: palette.text,
      ),
      textTheme: GoogleFonts.tajawalTextTheme(),
      extensions: <ThemeExtension<dynamic>>{EcoTaxiThemeExtension.fromPalette(palette)},
    );
  }

  static final ThemeData darkTheme = _fromPalette(darkColorPalette);

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: LightColorsManager.primary),
    scaffoldBackgroundColor: Color.fromARGB(236, 246, 242, 242),
    primarySwatch: Colors.orange,
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: LightColorsManager.primary),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      // selectedItemColor: Clrs.defaultColor,
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )),
  );
}
