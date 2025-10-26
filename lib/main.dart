import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';
import 'package:you_app_test/app/constants/string_constants.dart';

import 'app/routes/app_pages.dart';

GetStorage box = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YouApp Test",
      initialRoute: (box.read(StringConstants.token) != null)
          ? AppPages.hasLoggedIn
          : AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade50,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade50),
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
    ),
  );
}
