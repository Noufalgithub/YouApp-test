import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_test/app/data/services/auth_service.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;

  final AuthService _authService = AuthService();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordValid = false.obs;
  final isConfirmPasswordValid = false.obs;
  final isButtonActive = false.obs;

  void _validateForm() {
    final email = emailController.text;
    final username = usernameController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    final isNotEmptyValidation =
        email.isNotEmpty &&
        username.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty;

    // Validasi password minimal 8 karakter
    isPasswordValid.value = password.length >= 8;

    // Validasi confirm password sama dengan password
    isConfirmPasswordValid.value =
        password == confirmPassword && confirmPassword.isNotEmpty;

    isButtonActive.value =
        isNotEmptyValidation &&
        isPasswordValid.value &&
        isConfirmPasswordValid.value;
  }

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(_validateForm);
    usernameController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    isLoading.value = true;

    try {
      await _authService.register(
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text,
      );

      Get.dialog(
        AlertDialog(
          title: const Text('Registrasi Berhasil'),
          content: const Text('Silakan login dengan akun Anda.'),
          actions: [
            TextButton(
              onPressed: () {
                emailController.clear();
                usernameController.clear();
                passwordController.clear();
                confirmPasswordController.clear();

                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
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
