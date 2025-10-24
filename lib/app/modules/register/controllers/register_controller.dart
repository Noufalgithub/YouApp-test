import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_test/app/data/services/auth_service.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;

  final AuthService _authService = AuthService();

  Future<void> register({
    required String email,
    required String username,
    required String password,
  }) async {
    isLoading.value = true;

    try {
      await _authService.register(
        email: email,
        username: username,
        password: password,
      );

      Get.dialog(
        AlertDialog(
          title: const Text('Registrasi Berhasil'),
          content: const Text('Silakan login dengan akun Anda.'),
          actions: [
            TextButton(
              onPressed: () {
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
