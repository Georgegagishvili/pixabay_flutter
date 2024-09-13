import 'package:flutter/material.dart';

CustomColor lightColors = const CustomColor(
  black: Color.fromRGBO(16, 16, 16, 1),
);

CustomColor darkColors = const CustomColor(
  black: Color.fromRGBO(255, 255, 255, 1),
);

class CustomColor extends ThemeExtension<CustomColor> {
  final Color black;

  const CustomColor({
    required this.black,
  });

  @override
  ThemeExtension<CustomColor> copyWith({
    Color? black,
  }) {
    return CustomColor(
      black: black ?? this.black,
    );
  }

  @override
  ThemeExtension<CustomColor> lerp(
      covariant ThemeExtension<CustomColor>? other, double t) {
    if (other == null) return this;
    if (other is CustomColor) {
      return CustomColor(
        black: Color.lerp(black, other.black, t)!,
      );
    }
    return this;
  }
}
