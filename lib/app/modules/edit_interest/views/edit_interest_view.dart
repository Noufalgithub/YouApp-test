import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_app_test/app/constants/app_colors.dart';
import 'package:you_app_test/app/widgets/background/custom_background.dart';
import 'package:you_app_test/app/widgets/text_field/custom_text_field.dart';

import '../controllers/edit_interest_controller.dart';

class EditInterestView extends GetView<EditInterestController> {
  const EditInterestView({super.key});
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xFFABFFFD), Color(0xFF4599DB), Color(0xFFAADAFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Back', style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: CustomBackground(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 100, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tell everyone about yourself',
                      style: TextStyle(
                        color: AppColors.goldColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'What are your interests?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const CustomTextField(hintText: 'e.g. Travel, Music, Sports'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: controller.interests.map((item) {
                  return Chip(
                    label: Text(item),
                    backgroundColor: Colors.black26,
                    labelStyle: const TextStyle(color: Colors.white),
                    deleteIcon: const Icon(Icons.close, color: Colors.white),
                    onDeleted: () => controller.removeInterest(item),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
