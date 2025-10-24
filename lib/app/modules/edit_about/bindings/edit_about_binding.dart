import 'package:get/get.dart';

import '../controllers/edit_about_controller.dart';

class EditAboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAboutController>(
      () => EditAboutController(),
    );
  }
}
