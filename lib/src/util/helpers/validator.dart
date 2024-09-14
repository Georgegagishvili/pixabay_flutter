import 'package:mvvm/src/util/exports.dart';

mixin Validator {
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    if (!value.isEmail) {
      return 'Invalid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    final length = value.length;
    if (length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    } else if (value != password) {
      return 'Confirm password does not match';
    }
    return null;
  }

  String? validateEmptyField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }
}
