import 'package:flutter/material.dart';
import 'package:mvvm/commons/exports.dart';

extension ThemeExtension on BuildContext {
  CustomColor get theme => Theme.of(this).extension<CustomColor>()!;
}