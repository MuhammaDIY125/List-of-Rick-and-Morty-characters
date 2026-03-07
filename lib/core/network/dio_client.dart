import 'package:dio/dio.dart';
import 'dart:developer' as developer;

import '/core/network/api_constants.dart';
import '/core/network/network_interceptor.dart';
import '/core/network/retry_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: ApiConstants.connectTimeout,
          receiveTimeout: ApiConstants.receiveTimeout,
          validateStatus: (status) => status != null && status < 400,
        ),
      ) {
    // Автоматический retry для rate limiting (429) ошибок
    _dio.interceptors.add(RetryInterceptor(_dio));
    // Логирование запросов и ответов
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => developer.log(obj.toString(), name: 'Dio'),
      ),
    );
    // Обработка сетевых ошибок
    _dio.interceptors.add(NetworkInterceptor());
  }

  Dio get instance => _dio;
}
