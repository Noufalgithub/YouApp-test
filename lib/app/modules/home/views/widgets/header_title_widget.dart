import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({
    super.key,
    required this.title,
    required this.onEdit,
  });

  final String title;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: onEdit,
          child: SvgPicture.asset(
            'assets/icons/edit-2.svg',
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}
