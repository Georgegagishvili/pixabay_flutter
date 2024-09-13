import 'package:flutter/material.dart';
import 'package:mvvm/commons/exports.dart';

class AppTheme {
  static const _fontLato = 'Lato';

  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const smokyBlack = Color.fromRGBO(16, 16, 16, 1);
  static const pearlBlue = Color.fromRGBO(202, 218, 255, 1);

  static ThemeData appLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: white,
      brightness: Brightness.light,
      fontFamily: _fontLato,
      extensions: [darkColors],
      colorScheme: const ColorScheme.light(),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: darkColors.inversePrimary,
      ),
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
        border: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  /// If you consider theming application
  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: smokyBlack,
      fontFamily: _fontLato,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(),
      extensions: [darkColors],
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: pearlBlue,
      ),
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
        border: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
