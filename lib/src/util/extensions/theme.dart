import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';

extension ThemeExtension on BuildContext {
  CustomColors get theme => Theme.of(this).extension<CustomColors>()!;
}