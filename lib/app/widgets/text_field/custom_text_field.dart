import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:you_app_test/app/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.isPassword = false,
    this.isDateField = false,
    this.hintText,
    this.maxLines,
    this.keyboardType,
    this.controller,
    this.onSubmitted,
    this.onDateSelected,
    this.suffix,
  });

  final bool isPassword;
  final bool isDateField;
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function? onSubmitted;
  final Function(DateTime)? onDateSelected;
  final Widget? suffix;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final formatted = DateFormat('dd MMM yyyy').format(pickedDate);
      widget.controller?.text = formatted;
      widget.onDateSelected?.call(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDateField ? _pickDate : null,
      child: AbsorbPointer(
        absorbing: widget.isDateField,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A2A2E).withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscure : false,
            style: const TextStyle(color: Colors.white),
            maxLines: widget.maxLines ?? 1,
            keyboardType: widget.keyboardType,
            onSubmitted: (value) => widget.onSubmitted?.call(value),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.goldColor,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    )
                  : widget.isDateField
                  ? const Icon(Icons.calendar_today, color: AppColors.goldColor)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.suffix ?? const SizedBox()],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
