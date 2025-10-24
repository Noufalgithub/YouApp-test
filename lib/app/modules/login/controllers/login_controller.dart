import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_test/app/constants/string_constants.dart';
import 'package:you_app_test/app/data/services/auth_service.dart';
import 'package:you_app_test/app/routes/app_pages.dart';
import 'package:you_app_test/main.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;

  final AuthService _authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isButtonActive = false.obs;

  void _validateForm() {
    final isActive =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    isButtonActive.value = isActive;
  }

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      final response = await _authService.login(
        email: emailController.text,
        username: emailController.text,
        password: passwordController.text,
      );

      final token = response.data['access_token'];
      if (token == null || token.isEmpty) {
        throw Exception(response.data['message'] ?? 'Token tidak valid');
      }

      // Simpan token & redirect
      box.write(StringConstants.token, token);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      if (Get.isSnackbarOpen) {
        Get.back();
      }

      Get.snackbar(
        'Gagal',
        e.toString().replaceAll('Exception: ', ''),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
