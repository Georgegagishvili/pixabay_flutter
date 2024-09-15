import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/util/exports.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark) {
    final isDark =
        Preferences.instance.getBool(PreferenceKeys.IS_DARK_MODE) ?? true;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> switchTheme() async {
    final isDark =
        Preferences.instance.getBool(PreferenceKeys.IS_DARK_MODE) ?? true;
    Preferences.instance.setBool(PreferenceKeys.IS_DARK_MODE, !isDark);
    emit(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}
