class AppExceptions implements Exception {
  final message;
  final prefixes;

  AppExceptions([this.message, this.prefixes]);

  String toString() {
    return "$prefixes$message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException({String? message})
    : super(message, "Error During Communication");
}

class InvalidRequestException extends AppExceptions {
  InvalidRequestException({String? message})
    : super(message, "Invalid  Request");
}

class DatabaseException extends AppExceptions {
  DatabaseException({String? message}) : super(message, "Server Error");
}

class AuthenticaitonException extends AppExceptions {
  AuthenticaitonException({String? message})
    : super(message, "Invalid User not allowed");
}

class NotFoundException extends AppExceptions {
  NotFoundException({String? message}) : super(message, "Request Not found");
}
