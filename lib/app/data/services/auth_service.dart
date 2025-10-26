import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as this_is_get;
import 'package:you_app_test/app/constants/api_constants.dart';
import 'package:you_app_test/app/routes/app_pages.dart';
import 'package:you_app_test/main.dart';

import '../dio/dio_client.dart';

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
        ApiConstants.login,
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
        ApiConstants.register,
        data: {'email': email, 'username': username, 'password': password},
      );

      if (!_isSuccess(response.statusCode)) {
        throw Exception(response.data['message'] ?? 'Register gagal');
      }

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Register gagal');
    }
  }

  Future<void> logout() async {
    try {
      // Hapus semua data user & token
      await box.erase();

      // Redirect ke halaman login
      this_is_get.Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      this_is_get.Get.snackbar(
        'Gagal Logout',
        e.toString().replaceAll('Exception: ', ''),
        colorText: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFD32F2F),
      );
    }
  }
}
