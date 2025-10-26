import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:you_app_test/app/modules/home/controllers/home_controller.dart';
import 'package:you_app_test/app/routes/app_pages.dart';

import 'list_tile_widget.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = controller.profileModel.value?.data;

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0E191F),
          borderRadius: BorderRadius.circular(12),
        ),
        child: (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Column(
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
                  ListTileWidget(
                    title: 'Birthday',
                    value: data?.birthday ?? '-',
                  ),
                  ListTileWidget(
                    title: 'Horoscope',
                    value: data?.horoscope ?? '-',
                  ),
                  ListTileWidget(title: 'Zodiac', value: data?.zodiac ?? '-'),
                  ListTileWidget(title: 'Height', value: "${data?.height} cm"),
                  ListTileWidget(title: 'Weight', value: "${data?.weight} kg"),
                ],
              ),
      );
    });
  }
}
