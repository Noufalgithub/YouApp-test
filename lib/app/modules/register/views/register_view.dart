import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_app_test/app/constants/app_colors.dart';
import 'package:you_app_test/app/routes/app_pages.dart';
import 'package:you_app_test/app/widgets/background/custom_background.dart';
import 'package:you_app_test/app/widgets/button/custom_button.dart';
import 'package:you_app_test/app/widgets/text_field/custom_text_field.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparan
        elevation: 0, // tanpa bayangan
        title: const Text('Back', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: CustomBackground(
        child: Expanded(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 100, bottom: 24),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const CustomTextField(hintText: 'Enter Email'),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Create Username'),
              const SizedBox(height: 16),
              const CustomTextField(
                isPassword: true,
                hintText: 'Create Password',
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                isPassword: true,
                hintText: 'Confirm Password',
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Register',
                isActive: true,
                onPressed: () {
                  Get.offAllNamed(Routes.HOME);
                },
              ),
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Have an account? ",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: "Login here",
                      style: const TextStyle(
                        color: AppColors.goldColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
