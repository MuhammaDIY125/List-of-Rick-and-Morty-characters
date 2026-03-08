import 'package:dio/dio.dart';

import '/core/network/network_interceptor.dart';
import '/core/network/retry_interceptor.dart';

class DioClient {
  final Dio _dio;

  DioClient({required Dio dio}) : _dio = dio {
    // Обработка сетевых ошибок
    _dio.interceptors.add(NetworkInterceptor());
    // Автоматический retry для rate limiting (429) ошибок
    _dio.interceptors.add(RetryInterceptor(_dio));
  }

  Dio get instance => _dio;
}
