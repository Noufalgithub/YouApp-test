import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 2,
          colors: [Color(0xFF1F4247), Color(0xFF0D1D23), Color(0xFF09141A)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: child,
    );
  }
}
