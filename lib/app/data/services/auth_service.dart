import 'package:dio/dio.dart';

import 'dio_client.dart';

class AuthService {
  final Dio _dio = DioClient.instance;

  Future<Response> login({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'api/login',
        data: {'email': email, 'username': username, 'password': password},
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Login gagal');
    }
  }

  Future<Response> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'api/register',
        data: {'email': email, 'username': username, 'password': password},
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Register gagal');
    }
  }
}
