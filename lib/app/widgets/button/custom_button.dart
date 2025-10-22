import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.isActive = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onPressed : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 56,
        decoration: BoxDecoration(
          gradient: isActive
              ? const LinearGradient(
                  colors: [
                    Color(0xFF5CE1E6), // hijau muda kebiruan
                    Color(0xFF3498DB), // biru
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: isActive
              ? null
              : Colors.white.withOpacity(0.05), // versi nonaktif
          borderRadius: BorderRadius.circular(14),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: const Color(0xFF5CE1E6).withOpacity(0.4),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
