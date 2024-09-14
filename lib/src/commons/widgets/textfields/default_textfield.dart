import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    this.controller,
    this.label,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.obscureText = false,
    this.autofocus = false,
    this.maxLength,
    this.keyboardType,
    this.focusNode,
    this.validator,
    super.key,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool autofocus;
  final int? maxLength;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: context.theme.primary,
      validator: validator,
      obscureText: obscureText,
      autofocus: autofocus,
      maxLength: maxLength,
      onChanged: onChanged,
      style: AppTextStyles.fourteenW500.copyWith(
        color: context.theme.inverseSurface,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        counterText: '',
        fillColor: context.theme.surfaceVariant,
        hintStyle: AppTextStyles.fourteenW500
            .copyWith(color: context.theme.onSurfaceVariant),
        floatingLabelStyle: AppTextStyles.fourteenW500.copyWith(
          color: context.theme.primary,
        ),
        labelStyle: TextStyle(
          color: context.theme.onSurfaceVariant,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.inversePrimary,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.primary,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.inversePrimary,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.error,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.error,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 14,
        ),
      ),
    );
  }
}
