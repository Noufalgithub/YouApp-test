import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:you_app_test/app/constants/api_constants.dart';

class DioClient {
  static final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            responseType: ResponseType.json,
            validateStatus: (status) => status! < 500,
          ),
        )
        ..interceptors.addAll([
          _TokenInterceptor(),
          if (kDebugMode)
            LogInterceptor(
              request: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              error: true,
              requestHeader: false,
            ),
        ]);
  // Interceptor untuk token
  // ..interceptors.add(
  //   InterceptorsWrapper(
  //     onRequest: (options, handler) async {
  //       final box = GetStorage();
  //       final token = box.read(StringConstants.token);
  //       if (token != null && token.isNotEmpty) {
  //         options.headers['Authorization'] = 'Bearer $token';
  //       }
  //       return handler.next(options);
  //     },
  //     onError: (e, handler) {
  //       // Jika token expired (401), redirect ke login
  //       if (e.response?.statusCode == 401) {
  //         GetStorage().erase(); // hapus semua data
  //         Get.offAllNamed(Routes.LOGIN);
  //       }
  //       return handler.next(e);
  //     },
  //   ),
  // );

  static Dio get instance => _dio;
}

class _TokenInterceptor extends Interceptor {
  final _storage = GetStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _storage.read('token');
    if (token != null) {
      options.headers['x-access-token'] = token;
    }
    super.onRequest(options, handler);
  }
}
