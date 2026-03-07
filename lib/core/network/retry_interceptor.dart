import 'package:dio/dio.dart';
import 'dart:developer' as developer;
import 'dart:math';

/// Интерцептор для автоматического retry с exponential backoff на ошибки rate limiting (429)
class RetryInterceptor extends Interceptor {
  final Dio _dio;

  RetryInterceptor(this._dio);

  static const int _maxRetries = 3;
  static const Duration _initialDelay = Duration(milliseconds: 1000);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;

    // Обработка только 429 (Too Many Requests) ошибок
    if (statusCode != 429) {
      return handler.next(err);
    }

    // Получаем текущее количество попыток (0 для первой)
    final previousAttempt = _getRetryCount(err.requestOptions);

    if (previousAttempt >= _maxRetries) {
      developer.log(
        'Max retries ($previousAttempt) exceeded for ${err.requestOptions.path}',
        name: 'RetryInterceptor',
      );
      return handler.next(err);
    }

    // Парсим Retry-After header или используем exponential backoff
    final Duration delay = _calculateDelay(previousAttempt, err.response);

    developer.log(
      'Retry attempt ${previousAttempt + 1}/$_maxRetries for ${err.requestOptions.path} '
      'after ${delay.inMilliseconds}ms',
      name: 'RetryInterceptor',
    );

    // Ждём перед повтором
    await Future.delayed(delay);

    // Увеличиваем счётчик попыток и повторяем запрос
    final options = err.requestOptions.copyWith(
      extra: {
        ...err.requestOptions.extra,
        'retry_count': previousAttempt + 1,
      },
    );

    try {
      final response = await _dio.fetch(options);
      return handler.resolve(response);
    } on DioException catch (e) {
      // Если повтор тоже не удался, проходим через обработчик ошибок
      return handler.next(e);
    }
  }

  /// Получает количество уже выполненных попыток
  int _getRetryCount(RequestOptions options) {
    final extra = options.extra;
    if (extra.containsKey('retry_count')) {
      return extra['retry_count'] as int;
    }
    return 0;
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
