import 'package:http/http.dart';

enum ErrorTypes {
  networkError,
  tokenError,
  loginError,
  sessionError,
  otherError,
}

class ExceptionType implements Exception {
  final ErrorTypes type;

  ExceptionType(this.type);
}

void validator(Response response, dynamic json) {
  if (response.statusCode == 401) {
    final statusCode = json['status_code'] as int;

    if (statusCode == 7) {
      throw ExceptionType(ErrorTypes.tokenError);
    } else if (statusCode == 30 || statusCode == 33) {
      throw ExceptionType(ErrorTypes.loginError);
    } else if (statusCode == 17) {
      throw ExceptionType(ErrorTypes.sessionError);
    } else {
      throw ExceptionType(ErrorTypes.otherError);
    }
  }
}
