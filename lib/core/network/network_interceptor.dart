import 'package:dio/dio.dart';
import 'dart:developer' as developer;

import 'exceptions.dart';

/// Интерцептор для преобразования DioException в типизированные NetworkException
class NetworkInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _mapDioException(err);
    developer.log(
      'Network Error: ${exception.message}',
      name: 'NetworkInterceptor',
      error: err,
    );
    handler.reject(err.copyWith(error: exception));
  }

  /// Преобразует DioException в типизированное NetworkException
  NetworkException _mapDioException(DioException error) {
    final type = error.type;

    if (type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.receiveTimeout ||
        type == DioExceptionType.sendTimeout) {
      return TimeoutException();
    }

    if (type == DioExceptionType.connectionError) {
      if (error.message?.contains('SocketException') ?? false) {
        return ConnectionException();
      }
      return ConnectionException(message: error.message ?? 'Connection error');
    }

    if (type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode ?? 0;
      if (statusCode >= 500) {
        return ServerException(statusCode: statusCode);
      }
      if (statusCode >= 400) {
        final message = _getClientErrorMessage(statusCode);
        return ClientException(message: message, statusCode: statusCode);
      }
      return UnknownException();
    }

    if (type == DioExceptionType.unknown) {
      if (error.error is FormatException ||
          (error.message?.contains('json') ?? false)) {
        return ParseException();
      }
      return UnknownException(message: error.message ?? 'Unknown error');
    }

    if (type == DioExceptionType.badCertificate) {
      return CertificateException();
    }

    if (type == DioExceptionType.cancel) {
      return UnknownException(message: 'Request cancelled');
    }

    return UnknownException(message: error.message ?? 'Unknown error');
  }

  /// Описание ошибки клиента по статус-коду
  String _getClientErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 429:
        return 'Too many requests. Please try again later';
      default:
        return 'Client error ($statusCode)';
    }
  }
}
