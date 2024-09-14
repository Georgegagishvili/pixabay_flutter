import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _DateTextFieldState extends State<DateTextField> {
  late final _controller = widget.controller ?? TextEditingController();

  @override
  void dispose() {
    super.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: _selectDate,
      validator: widget.validator,
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 14,
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final currentYear = now.year;
    final firstDate = DateTime(currentYear - 99);
    final lastDate = DateTime(now.year - 18, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? lastDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null) {
      _controller.text = DateFormat(DateFormat.YEAR_MONTH_DAY).format(picked);
      widget.onChanged?.call(picked);
    }
  }
}

class DateTextField extends StatefulWidget {
  const DateTextField({
    this.controller,
    this.onChanged,
    this.label,
    this.hint,
    this.initialDate,
    this.validator,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<DateTime>? onChanged;
  final String? label;
  final String? hint;
  final DateTime? initialDate;
  final String? Function(String?)? validator;

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}
