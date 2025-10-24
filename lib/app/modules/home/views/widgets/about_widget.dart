import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:you_app_test/app/routes/app_pages.dart';

import 'list_tile_widget.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0E191F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "About",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.EDIT_ABOUT);
                },
                child: SvgPicture.asset(
                  'assets/icons/edit-2.svg',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const ListTileWidget(title: 'Birthday', value: '28/08/1995 (Age 28)'),
          const ListTileWidget(title: 'Horoscope', value: 'Virgo'),
          const ListTileWidget(title: 'Zodiac', value: 'Pig'),
          const ListTileWidget(title: 'Height', value: '175 cm'),
          const ListTileWidget(title: 'Weight', value: '69 kg'),
        ],
      ),
    );
  }
}
