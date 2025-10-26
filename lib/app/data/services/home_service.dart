import 'package:dio/dio.dart';
import 'package:you_app_test/app/constants/api_constants.dart';

import '../dio/dio_client.dart';

class HomeService {
  final Dio _dio = DioClient.instance;

  // Helper: validasi status sukses
  bool _isSuccess(int? status) =>
      status != null && status >= 200 && status < 300;

  Future<Response> getProfile() async {
    try {
      final response = await _dio.get(ApiConstants.getProfile);

      if (!_isSuccess(response.statusCode)) {
        throw Exception(response.data['message'] ?? 'Get Profile gagal');
      }

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Get Profile gagal');
    }
  }

  // Future<List<SurahModel>> getProfile() async {
  //   try {
  //     final response = await _dio.get(ApiConstants.getProfile);
  //     final List data = response.data;
  //     return data.map((e) => SurahModel.fromJson(e)).toList();
  //   } on DioException catch (e) {
  //     throw Exception(e.message);
  //   }
  // }

  Future<Response> createProfile({
    required String name,
    required String birhday,
    required int height,
    required int weight,
    required List<String> interests,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.createProfile,
        data: {
          "name": name,
          "birthday": birhday,
          "height": height,
          "weight": weight,
          "interests": interests,
        },
      );

      if (!_isSuccess(response.statusCode)) {
        throw Exception(response.data['message'] ?? 'Create Profile gagal');
      }

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Create Profile gagal');
    }
  }

  Future<Response> updateProfile({
    required String name,
    required String birhday,
    required int height,
    required int weight,
    required List<String> interests,
  }) async {
    try {
      final response = await _dio.put(
        ApiConstants.updateProfile,
        data: {
          "name": name,
          "birthday": birhday,
          "height": height,
          "weight": weight,
          "interests": interests,
        },
      );

      if (!_isSuccess(response.statusCode)) {
        throw Exception(response.data['message'] ?? 'Update Profile gagal');
      }

      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? 'Update Profile gagal');
    }
  }
}
