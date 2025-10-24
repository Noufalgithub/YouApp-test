import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app_test/app/constants/app_colors.dart';
import 'package:you_app_test/app/routes/app_pages.dart';
import 'package:you_app_test/app/widgets/background/custom_background.dart';
import 'package:you_app_test/app/widgets/button/custom_button.dart';
import 'package:you_app_test/app/widgets/text_field/custom_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparan
        elevation: 0, // tanpa bayangan
      ),
      body: CustomBackground(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 100, bottom: 24),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomTextField(
              controller: controller.emailController,
              hintText: 'Enter Username/Email',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: controller.passwordController,
              isPassword: true,
              hintText: 'Enter Password',
            ),
            const SizedBox(height: 24),
            Obx(
              () => CustomButton(
                text: 'Login',
                isLoading: controller.isLoading.value,
                isActive: controller.isButtonActive.value,
                onPressed: controller.isButtonActive.value
                    ? () => controller.login()
                    : null,
              ),
            ),
            const SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "No account? ",
                style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: "Register here",
                    style: const TextStyle(
                      color: AppColors.goldColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.REGISTER);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
