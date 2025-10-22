import 'package:flutter/material.dart';
import 'package:you_app_test/app/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, this.isPassword = false, this.hintText});

  final bool isPassword;
  final String? hintText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A2A2E).withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: (widget.isPassword) ? _obscure : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
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
              : null,
        ),
      ),
    );
  }
}
