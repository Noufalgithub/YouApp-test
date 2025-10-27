import 'package:get/get.dart';
import 'package:you_app_test/app/modules/edit_about/controllers/edit_about_controller.dart';
import 'package:you_app_test/app/modules/home/controllers/home_controller.dart';

class EditInterestController extends GetxController {
  final RxList<dynamic> interests = [].obs;

  var editAboutController = Get.put(EditAboutController());
  var homeController = Get.find<HomeController>();

  void addInterest(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    if (!interests.contains(trimmed)) {
      interests.add(trimmed);

      editAboutController.editProfile(
        name: homeController.profileModel.value?.data?.name ?? '',
        birhday: homeController.profileModel.value?.data?.birthday ?? '',
        height: homeController.profileModel.value?.data?.height ?? 0,
        weight: homeController.profileModel.value?.data?.weight ?? 0,
        interest: interests,
      );
    }
  }

  void removeInterest(String value) {
    interests.remove(value);

    editAboutController.editProfile(
      name: homeController.profileModel.value?.data?.name ?? '',
      birhday: homeController.profileModel.value?.data?.birthday ?? '',
      height: homeController.profileModel.value?.data?.height ?? 0,
      weight: homeController.profileModel.value?.data?.weight ?? 0,
      interest: interests,
    );
  }

  bool get isEmpty =>
      interests.isEmpty || interests.every((e) => e!.trim().isEmpty);

  @override
  void onInit() {
    super.onInit();

    interests.value = homeController.profileModel.value?.data?.interests ?? [];
  }
}
