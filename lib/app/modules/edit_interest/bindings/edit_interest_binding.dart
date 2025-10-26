import 'package:get/get.dart';

import '../controllers/edit_interest_controller.dart';

class EditInterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditInterestController>(() => EditInterestController());
  }
}
