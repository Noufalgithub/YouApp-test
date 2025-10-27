import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_test/app/data/services/home_service.dart';
import 'package:you_app_test/app/modules/home/controllers/home_controller.dart';
import 'package:you_app_test/app/widgets/dialog/dialog_loading.dart';

class EditAboutController extends GetxController {
  final isLoading = false.obs;

  final HomeService _homeService = HomeService();

  var homeController = Get.find<HomeController>();
  final nameController = TextEditingController();
  final birthdateController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    var data = homeController.profileModel.value?.data;
    nameController.text = data?.name ?? '';
    birthdateController.text = data?.birthday ?? '';
    heightController.text = data?.height.toString() ?? '';
    weightController.text = data?.weight.toString() ?? '';
  }

  Future<void> editProfile({
    required String name,
    required String birhday,
    required int height,
    required int weight,
    List? interest,
  }) async {
    if (interest == null) {
      loadingBuilder();
    }

    var dataInterest = homeController.profileModel.value?.data?.interests ?? [];

    try {
      await _homeService
          .updateProfile(
            name: name,
            birhday: birhday,
            height: height,
            weight: weight,
            interests: interest ?? dataInterest,
          )
          .then((value) {
            // update profile
            homeController.getProfile();
          });

      if (interest == null) {
        // Close dialog loading
        Get.back();
      }

      if (interest == null) {
        Get.dialog(
          AlertDialog(
            title: const Text('Update Successful'),
            content: const Text('Your profile has been updated successfully.'),
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
      }
    } catch (e) {
      if (interest == null) {
        // Close dialog loading
        Get.back();
      }

      // Close snackbar
      if (Get.isSnackbarOpen) {
        Get.back();
      }

      Get.snackbar(
        'Gagal',
        e.toString().replaceAll('Exception: ', ''),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
      print(e.toString().replaceAll('Exception: ', ''));
    } finally {
      isLoading.value = false;
    }
  }
}
