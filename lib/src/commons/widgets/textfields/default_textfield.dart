import 'package:flutter/material.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class _DefaultTextFieldState extends State<DefaultTextField> {
  late bool _obscureText = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      cursorColor: context.theme.primary,
      validator: widget.validator,
      obscureText: _obscureText,
      autofocus: widget.autofocus,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      style: AppTextStyles.fourteenW500.copyWith(
        color: context.theme.inverseSurface,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
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
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  Icons.visibility,
                  color: context.theme.onSurfaceVariant,
                ),
                onPressed: () {
                  _obscureText = !_obscureText;
                  setState(() {});
                },
              )
            : null,
      ),
    );
  }
}

class DefaultTextField extends StatefulWidget {
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
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}
