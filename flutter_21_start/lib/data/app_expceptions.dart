class AppExpceptions implements Exception {
  final _message;
  final _prefix;

  AppExpceptions([this._message, this._prefix]);
  String toString() {
    return ' $_prefix$_message';
  }
}

class InternetExcepion extends AppExpceptions {
  InternetExcepion([String? message]) : super(message, "No internet");
}

class RequestTimeOut extends AppExpceptions {
  RequestTimeOut([String? message]) : super(message, "Request Time Out");
}

class ServerException extends AppExpceptions {
  ServerException([String? message]) : super(message, "Internal Server Error");
}
