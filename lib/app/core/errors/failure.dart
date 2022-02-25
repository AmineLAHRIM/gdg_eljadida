abstract class Failure {}

class ConnectionFailure extends Failure {
  String? message;

  ConnectionFailure({this.message});

  @override
  String toString() {
    return 'Sorry no connection';
  }
}

class ServerFailure extends Failure {
  String? message;

  ServerFailure({this.message});

  @override
  String toString() {
    return 'Sorry no connection';
  }
}

class TokenFailure extends Failure {
  String? message;

  TokenFailure({this.message});

  @override
  String toString() {
    return message ?? 'For security Reasion please try again!';
  }
}

class CacheFailure extends Failure {
  String? message;

  CacheFailure({this.message});

  @override
  String toString() {
    return message ?? 'Cache failure!';
  }
}
