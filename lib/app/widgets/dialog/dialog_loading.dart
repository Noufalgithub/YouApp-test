import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> loadingBuilder() {
  return Get.dialog(
    barrierDismissible: false,
    Center(
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const CircularProgressIndicator(strokeWidth: 5),
      ),
    ),
  );
}
