// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:you_app_test/app/data/services/auth_service.dart';

// class MockAuthService extends Mock implements AuthService {}

// void main() {
//   late MockAuthService mockAuthService;

//   setUp(() {
//     mockAuthService = MockAuthService();
//   });

//   group('AuthService', () {
//     test('Login berhasil mengembalikan token', () async {
//       when(
//         mockAuthService.login(
//           email: 'email@email.com',
//           username: 'username',
//           password: 'password',
//         ),
//       ).thenAnswer((_) async => {'token': 'abc123'});

//       final result = await mockAuthService.login(
//         email: 'email@email.com',
//         username: 'username',
//         password: 'password',
//       );

//       expect(result, isA<Map>());
//       expect(result['token'], equals('abc123'));
//       verify(
//         mockAuthService.login(
//           email: 'email@email.com',
//           username: 'username',
//           password: 'password',
//         ),
//       ).called(1);
//     });

//     test('Register berhasil', () async {
//       when(
//         mockAuthService.register(any, any, any),
//       ).thenAnswer((_) async => true);

//       final result = await mockAuthService.register(
//         email: 'email@email.com',
//         username: 'username',
//         password: 'password',
//       );

//       expect(result, isTrue);
//     });
//   });
// }
