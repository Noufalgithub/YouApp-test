import 'package:get/get.dart';

import '../modules/edit_about/bindings/edit_about_binding.dart';
import '../modules/edit_about/views/edit_about_view.dart';
import '../modules/edit_interest/bindings/edit_interest_binding.dart';
import '../modules/edit_interest/views/edit_interest_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.LOGIN;
  static const hasLoggedIn = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_INTEREST,
      page: () => const EditInterestView(),
      binding: EditInterestBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ABOUT,
      page: () => const EditAboutView(),
      binding: EditAboutBinding(),
    ),
  ];
}
