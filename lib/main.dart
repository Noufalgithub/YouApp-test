import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YouApp Test",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade50,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade50),
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
    ),
  );
}
