import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_test/app/data/models/profile_model/profile_model.dart';
import 'package:you_app_test/app/data/services/auth_service.dart';
import 'package:you_app_test/app/data/services/home_service.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;

  final HomeService _homeService = HomeService();
  final AuthService _authService = AuthService();

  var profileModel = Rxn<ProfileModel>();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    isLoading.value = true;
    profileModel.value = null;

    try {
      final response = await _homeService.getProfile();
      profileModel.value = response;
    } catch (e) {
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

  void logout() {
    Get.defaultDialog(
      title: 'Konfirmasi',
      middleText: 'Apakah kamu yakin ingin keluar?',
      textCancel: 'Batal',
      textConfirm: 'Keluar',
      confirmTextColor: Colors.white,
      buttonColor: Colors.redAccent,
      onConfirm: () {
        Get.back(); // Tutup dialog
        _authService.logout();
      },
    );
  }
}
