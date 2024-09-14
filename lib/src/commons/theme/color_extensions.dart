import 'package:flutter/material.dart';

CustomColors darkColors = const CustomColors(
  primary: Color(0xFFFFB871),
  onPrimary: Color(0xFF14120C),
  primaryContainer: Color(0xFF6A3C00),
  onPrimaryContainer: Color(0xFFF0E9DF),
  secondary: Color(0xFFFFDBCB),
  onSecondary: Color(0xFF141413),
  secondaryContainer: Color(0xFF552000),
  onSecondaryContainer: Color(0xFFEDE4DF),
  tertiary: Color(0xFFABD285),
  onTertiary: Color(0xFF11140E),
  tertiaryContainer: Color(0xFF2F4F11),
  onTertiaryContainer: Color(0xFFE7ECE2),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF141211),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFF6DFE1),
  background: Color(0xFF1D1915),
  onBackground: Color(0xFFEDECEC),
  surface: Color(0xFF1D1915),
  onSurface: Color(0xFFEDECEC),
  surfaceVariant: Color(0xFF463F38),
  onSurfaceVariant: Color(0xFFE1E0DF),
  inverseSurface: Color(0xFFFFFBF7),
  onInverseSurface: Color(0xFF141313),
  outline: Color(0xFF7D7676),
  outlineVariant: Color(0xFF2E2C2C),
  shadow: Color(0xFF000000),
  inversePrimary: Color(0xFF775D3F),
  surfaceTint: Color(0xFFFFB871),
);

CustomColors lightColors = const CustomColors(
  primary: Color(0xFF8B5000),
  onPrimary: Color(0xFFF0E9DF),
  primaryContainer: Color(0xFFFFDCBE),
  onPrimaryContainer: Color(0xFF141210),
  secondary: Color(0xFFB6602F),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFEDE6),
  onSecondaryContainer: Color(0xFF141413),
  tertiary: Color(0xFF466827),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFC6EF9F),
  onTertiaryContainer: Color(0xFF11140E),
  error: Color(0xFFB00020),
  onError: Color(0xFFB00020),
  errorContainer: Color(0xFFFCD8DF),
  onErrorContainer: Color(0xFF141213),
  background: Color(0xFFFBFAF8),
  onBackground: Color(0xFF090909),
  surface: Color(0xFFFBFAF8),
  onSurface: Color(0xFF090909),
  surfaceVariant: Color(0xFFE8E5E0),
  onSurfaceVariant: Color(0xFF121111),
  inverseSurface: Color(0xFF141210),
  onInverseSurface: Color(0xFFF5F5F5),
  outline: Color(0xFF7C7C7C),
  outlineVariant: Color(0xFFC8C8C8),
  shadow: Color(0xFF000000),
  inversePrimary: Color(0xFFF5CC95),
  surfaceTint: Color(0xFF8B5000),
);

class CustomColors extends ThemeExtension<CustomColors> {
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color inversePrimary;
  final Color surfaceTint;

  const CustomColors({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.inversePrimary,
    required this.surfaceTint,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? inversePrimary,
    Color? surfaceTint,
  }) {
    return CustomColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      onInverseSurface: onInverseSurface ?? this.onInverseSurface,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      shadow: shadow ?? this.shadow,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      surfaceTint: surfaceTint ?? this.surfaceTint,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other == null) return this;
    if (other is CustomColors) {
      return CustomColors(
        primary: Color.lerp(primary, other.primary, t)!,
        onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
        primaryContainer:
            Color.lerp(primaryContainer, other.primaryContainer, t)!,
        onPrimaryContainer:
            Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
        secondary: Color.lerp(secondary, other.secondary, t)!,
        onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
        secondaryContainer:
            Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
        onSecondaryContainer:
            Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
        tertiary: Color.lerp(tertiary, other.tertiary, t)!,
        onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
        tertiaryContainer:
            Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
        onTertiaryContainer:
            Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
        error: Color.lerp(error, other.error, t)!,
        onError: Color.lerp(onError, other.onError, t)!,
        errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
        onErrorContainer:
            Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
        background: Color.lerp(background, other.background, t)!,
        onBackground: Color.lerp(onBackground, other.onBackground, t)!,
        surface: Color.lerp(surface, other.surface, t)!,
        onSurface: Color.lerp(onSurface, other.onSurface, t)!,
        surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
        onSurfaceVariant:
            Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t)!,
        inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
        onInverseSurface:
            Color.lerp(onInverseSurface, other.onInverseSurface, t)!,
        outline: Color.lerp(outline, other.outline, t)!,
        outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
        shadow: Color.lerp(shadow, other.shadow, t)!,
        inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
        surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      );
    }
    return this;
  }
}
