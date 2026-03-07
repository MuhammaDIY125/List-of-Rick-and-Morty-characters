/// Базовое исключение для всех сетевых ошибок
abstract class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

/// Нет интернета или соединение потеряно
class ConnectionException extends NetworkException {
  ConnectionException({String message = 'No internet connection'})
    : super(message);
}

/// Запрос превысил timeout
class TimeoutException extends NetworkException {
  TimeoutException({String message = 'Request timeout. Please try again'})
    : super(message);
}

/// Ошибка сервера (5xx)
class ServerException extends NetworkException {
  final int? statusCode;

  ServerException({
    String message = 'Server error. Please try again later',
    this.statusCode,
  }) : super(message);
}

/// Ошибка клиента (4xx)
class ClientException extends NetworkException {
  final int statusCode;

  ClientException({required String message, required this.statusCode})
    : super(message);
}

/// Ошибка при парсинге JSON
class ParseException extends NetworkException {
  ParseException({String message = 'Failed to parse data'}) : super(message);
}

/// Неизвестная ошибка
class UnknownException extends NetworkException {
  UnknownException({String message = 'Unknown error occurred'})
    : super(message);
}
