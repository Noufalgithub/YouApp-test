import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_app_test/app/constants/app_colors.dart';
import 'package:you_app_test/app/modules/home/controllers/home_controller.dart';
import 'package:you_app_test/app/modules/home/views/widgets/banner_widget.dart';
import 'package:you_app_test/app/widgets/text_field/custom_text_field.dart';

import '../controllers/edit_about_controller.dart';

class EditAboutView extends GetView<EditAboutController> {
  const EditAboutView({super.key});
  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Back', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          BannerWidget(controller: homeController),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0E191F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Save & Update',
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const ListTileWidget(
                  label: 'Display Name',
                  child: CustomTextField(hintText: 'Enter name'),
                ),
                const SizedBox(height: 12),
                const ListTileWidget(
                  label: 'Birthdate',
                  child: CustomTextField(hintText: 'DD MM YYYY'),
                ),
                const SizedBox(height: 12),
                const ListTileWidget(
                  label: 'Height',
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    hintText: 'Add height',
                  ),
                ),
                const SizedBox(height: 12),
                const ListTileWidget(
                  label: 'Weight',
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    hintText: 'Add weight',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(
            '$label:',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: child),
      ],
    );
  }
}
