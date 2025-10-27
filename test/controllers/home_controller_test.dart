// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mockito/mockito.dart';
// import 'package:you_app_test/app/data/services/home_service.dart';
// import 'package:you_app_test/app/modules/home/controllers/home_controller.dart';

// class MockHomeService extends Mock implements HomeService {}

// void main() {
//   late MockHomeService mockHomeService;
//   late HomeController controller;

//   setUp(() {
//     mockHomeService = MockHomeService();
//     Get.put<HomeService>(mockHomeService);
//     controller = HomeController();
//   });

//   tearDown(() {
//     Get.reset();
//   });

//   group('HomeController', () {
//     test('Load data home memanggil HomeService', () async {
//       when(
//         mockHomeService.getHomeData(),
//       ).thenAnswer((_) async => {'name': 'Noufal'});

//       await controller.loadData();

//       verify(mockHomeService.getHomeData()).called(1);
//       expect(controller.userData['name'], 'Noufal');
//     });
//   });
// }
