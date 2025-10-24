import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_app_test/app/constants/app_colors.dart';
import 'package:you_app_test/app/modules/home/views/widgets/interest_widget.dart';

import '../controllers/home_controller.dart';
import 'widgets/about_widget.dart';
import 'widgets/banner_widget.dart';

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
        children: const [
          BannerWidget(),
          SizedBox(height: 16),
          AboutWidget(),
          SizedBox(height: 16),
          InterestWidget(),
        ],
      ),
    );
  }
}
