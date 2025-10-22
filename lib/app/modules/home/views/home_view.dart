import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_app_test/app/constants/app_colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('@Johndoe', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.blueGrey,
            child: const Column(
              children: [
                Text(
                  "@Jhondoe's Profile Banner, 28",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Male",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          const Icon(Icons.account_circle, color: Colors.white, size: 100),
          const SizedBox(height: 24),
          const Text(
            'Welcome to the Home Page!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
