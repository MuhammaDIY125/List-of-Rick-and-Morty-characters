import 'package:dio/dio.dart';
import 'dart:developer' as developer;
import 'dart:math';

/// Интерцептор для автоматического retry с exponential backoff на ошибки rate limiting (429)
class RetryInterceptor extends Interceptor {
  final Dio _dio;

  RetryInterceptor(this._dio);

  static const int _maxRetries = 3;
  static const Duration _initialDelay = Duration(milliseconds: 1000);
  static const String _retryCountKey = 'retry_count';
  static const String _skipRetryKey = 'skip_retry_interceptor';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldSkipRetry(err.requestOptions)) {
      return handler.next(err);
    }

    final statusCode = err.response?.statusCode;

    // Обработка только 429 (Too Many Requests) ошибок
    if (statusCode != 429) {
      return handler.next(err);
    }

    // Получаем текущее количество уже выполненных повторов (0 для первой ошибки)
    int currentAttempt = _getRetryCount(err.requestOptions);
    DioException lastError = err;

    if (currentAttempt >= _maxRetries) {
      developer.log(
        'Max retries ($currentAttempt) exceeded for ${err.requestOptions.path}',
        name: 'RetryInterceptor',
      );
      return handler.next(err);
    }

    while (currentAttempt < _maxRetries) {
      // Парсим Retry-After header или используем exponential backoff
      final delay = _calculateDelay(currentAttempt, lastError.response);

      developer.log(
        'Retry attempt ${currentAttempt + 1}/$_maxRetries for ${err.requestOptions.path} '
        'after ${delay.inMilliseconds}ms',
        name: 'RetryInterceptor',
      );

      // Ждём перед повтором
      await Future.delayed(delay);

      // Помечаем запрос как внутренний retry, чтобы interceptor не заходил в себя повторно
      final options = lastError.requestOptions.copyWith(
        extra: {
          ...lastError.requestOptions.extra,
          _retryCountKey: currentAttempt + 1,
          _skipRetryKey: true,
        },
      );

      try {
        final response = await _dio.fetch(options);
        return handler.resolve(response);
      } on DioException catch (e) {
        lastError = e;
        if (e.response?.statusCode != 429) {
          return handler.next(e);
        }
        currentAttempt++;
      }
    }

    developer.log(
      'Max retries ($_maxRetries) exceeded for ${err.requestOptions.path}',
      name: 'RetryInterceptor',
    );
    return handler.next(lastError);
  }

  /// Получает количество уже выполненных попыток
  int _getRetryCount(RequestOptions options) {
    final extra = options.extra;
    if (extra.containsKey(_retryCountKey)) {
      return extra[_retryCountKey] as int;
    }
    return 0;
  }

  bool _shouldSkipRetry(RequestOptions options) {
    return options.extra[_skipRetryKey] == true;
  }

  /// Вычисляет задержку перед повтором на основе Retry-After или exponential backoff
  Duration _calculateDelay(int attemptNumber, Response? response) {
    // Пытаемся парсить Retry-After header (в секундах или HTTP-date)
    final retryAfterHeader = response?.headers['retry-after']?.first;

    if (retryAfterHeader != null) {
      final delaySeconds = int.tryParse(retryAfterHeader);
      if (delaySeconds != null) {
        developer.log(
          'Using Retry-After header value: $delaySeconds seconds',
          name: 'RetryInterceptor',
        );
        return Duration(seconds: min(delaySeconds, 30)); // Макс 30 секунд
      }
    }

    // Exponential backoff: 1s, 2s, 4s, затем макс 4s
    final delayMs = min(
      _initialDelay.inMilliseconds * pow(2, attemptNumber).toInt(),
      4000, // Максимум 4 секунды
    );

    return Duration(milliseconds: delayMs);
  }
}
