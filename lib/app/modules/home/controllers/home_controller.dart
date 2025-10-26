import 'package:get/get.dart';
import 'package:you_app_test/app/data/services/home_service.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;

  final HomeService _homeService = HomeService();

  @override
  void onInit() {
    super.onInit();
    // getProfile();
  }

  // Future<void> getProfile() async {
  //   isLoading.value = true;

  //   try {
  //     await _homeService.getProfile();
  //   } catch (e) {
  //     if (Get.isSnackbarOpen) {
  //       Get.back();
  //     }

  //     Get.snackbar(
  //       'Gagal',
  //       e.toString().replaceAll('Exception: ', ''),
  //       colorText: Colors.white,
  //       backgroundColor: Colors.redAccent,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
