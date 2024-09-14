import 'package:flutter/material.dart';
import 'package:mvvm/src/util/exports.dart';
import 'package:mvvm/src/commons/exports.dart';

extension SnackbarExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.sixteenW500.copyWith(
            color:
                !isError ? theme.onTertiaryContainer : theme.onErrorContainer,
          ),
        ),
        backgroundColor:
            !isError ? theme.tertiaryContainer : theme.errorContainer,
      ),
    );
  }
}
