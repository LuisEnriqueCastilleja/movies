class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException([this._message = '', this._prefix = '']);

  @override
  String toString() {
    return _prefix + _message;
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message = 'Error During Communication'])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends AppException {
  BadRequestException([String message = 'Invalid Request'])
      : super(message, 'Invalid Request: ');
}

class UnauthorizeException extends AppException {
  UnauthorizeException([String message = 'Unauthorized'])
      : super(message, 'Unauthorized: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String message = 'Invalid Input'])
      : super(message, 'Invalid Input: ');
}
