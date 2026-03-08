import 'package:dio/dio.dart';

import '/core/network/api_constants.dart';

class DioFactory {
  const DioFactory._();

  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        validateStatus: (status) => status != null && status < 400,
      ),
    );
  }
}
