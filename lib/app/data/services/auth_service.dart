import 'package:dio/dio.dart';

import 'dio_client.dart';

class AuthService {
  final Dio _dio = DioClient.instance;

  // Helper: validasi status sukses
  bool _isSuccess(int? status) =>
      status != null && status >= 200 && status < 300;

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

      if (!_isSuccess(response.statusCode)) {
        throw Exception(response.data['message'] ?? 'Login gagal');
      }

      // Cek token
      final token = response.data['access_token'];
      if (token == null || token.isEmpty) {
        throw Exception(response.data['message'] ?? 'Login gagal');
      }

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login gagal');
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
