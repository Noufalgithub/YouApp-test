// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mockito/mockito.dart';
// import 'package:you_app_test/app/data/services/auth_service.dart';
// import 'package:you_app_test/app/modules/login/controllers/login_controller.dart';

// class MockAuthService extends Mock implements AuthService {}

// void main() {
//   late MockAuthService mockAuthService;
//   late LoginController controller;

//   setUp(() {
//     mockAuthService = MockAuthService();
//     Get.put<AuthService>(mockAuthService);
//     controller = LoginController();
//   });

//   tearDown(() {
//     Get.reset();
//   });

//   group('LoginController', () {
//     test('Login berhasil mengubah isLoading dan memanggil AuthService', () async {
//       when(mockAuthService.login(any, any))
//           .thenAnswer((_) async => {'token': 'abc123'});

//       controller.emailController.text = 'test@mail.com';
//       controller.passwordController.text = '123456';

//       await controller.login();

//       verify(mockAuthService.login('test@mail.com', '123456')).called(1);
//       expect(controller.isLoading.value, isFalse);
//     });
//   });
// }
