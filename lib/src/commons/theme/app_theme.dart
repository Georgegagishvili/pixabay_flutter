import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';

class AppTheme {
  static const _fontLato = 'Lato';

  static InputDecorationTheme _inputDecorationTheme(CustomColors colors) {
    return InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.primary,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.error,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.error,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      fillColor: colors.surfaceVariant,
      hintStyle: AppTextStyles.fourteenW500.copyWith(
        color: colors.onSurfaceVariant,
      ),
      floatingLabelStyle: AppTextStyles.fourteenW500.copyWith(
        color: colors.primary,
      ),
      labelStyle: TextStyle(
        color: colors.onSurfaceVariant,
      ),
      filled: true,
    );
  }

  static ThemeData appLightTheme(CustomColors colors) {
    return ThemeData(
      scaffoldBackgroundColor: colors.background,
      brightness: Brightness.light,
      fontFamily: _fontLato,
      extensions: [colors],
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        inverseSurface: colors.inverseSurface,
        surfaceTint: colors.surfaceTint,
        inversePrimary: colors.inversePrimary,
        outlineVariant: colors.outlineVariant,
        outline: colors.outline,
        onInverseSurface: colors.onInverseSurface,
        onSurfaceVariant: colors.onSurfaceVariant,
        surface: colors.surface,
        onErrorContainer: colors.onErrorContainer,
        errorContainer: colors.errorContainer,
        error: colors.error,
        onError: colors.onError,
        onTertiaryContainer: colors.onTertiaryContainer,
        tertiaryContainer: colors.tertiaryContainer,
        onTertiary: colors.onTertiary,
        tertiary: colors.tertiary,
        onSecondaryContainer: colors.onSecondaryContainer,
        secondaryContainer: colors.secondaryContainer,
        onSecondary: colors.onSecondary,
        onPrimaryContainer: colors.onPrimaryContainer,
        primaryContainer: colors.primaryContainer,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        onSurface: colors.onSurface,
        secondary: colors.secondary,
        shadow: colors.shadow,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.inversePrimary,
      ),
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colors.background,
      ),
      inputDecorationTheme: _inputDecorationTheme(colors),
    );
  }

  /// If you consider theming application
  static ThemeData darkTheme(CustomColors colors) {
    return ThemeData(
      scaffoldBackgroundColor: colors.background,
      fontFamily: _fontLato,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        inverseSurface: colors.inverseSurface,
        surfaceTint: colors.surfaceTint,
        inversePrimary: colors.inversePrimary,
        outlineVariant: colors.outlineVariant,
        outline: colors.outline,
        onInverseSurface: colors.onInverseSurface,
        onSurfaceVariant: colors.onSurfaceVariant,
        surface: colors.surface,
        onErrorContainer: colors.onErrorContainer,
        errorContainer: colors.errorContainer,
        error: colors.error,
        onError: colors.onError,
        onTertiaryContainer: colors.onTertiaryContainer,
        tertiaryContainer: colors.tertiaryContainer,
        onTertiary: colors.onTertiary,
        tertiary: colors.tertiary,
        onSecondaryContainer: colors.onSecondaryContainer,
        secondaryContainer: colors.secondaryContainer,
        onSecondary: colors.onSecondary,
        onPrimaryContainer: colors.onPrimaryContainer,
        primaryContainer: colors.primaryContainer,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        onSurface: colors.onSurface,
        secondary: colors.secondary,
        shadow: colors.shadow,
      ),
      extensions: [colors],
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.inversePrimary,
      ),
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colors.background,
      ),
      inputDecorationTheme: _inputDecorationTheme(colors),
    );
  }
}
