import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
        ..interceptors.addIf(
          kDebugMode,
          LogInterceptor(
            request: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            requestHeader: false,
          ),
        );

  static Dio get instance => _dio;
}

extension on Interceptors {
  void addIf(bool condition, Interceptor interceptor) {
    if (condition) add(interceptor);
  }
}
