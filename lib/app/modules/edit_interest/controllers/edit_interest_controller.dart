import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInterestController extends GetxController {
  final Rx<TextEditingController> interestController =
      TextEditingController().obs;
  final RxList<String> interests = ['Gaming'].obs;

  void addInterest(String text) {
    if (text.trim().isEmpty) return;
    interests.add(text.trim());
    interestController.value.clear();
  }

  void removeInterest(String text) {
    interests.remove(text);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
