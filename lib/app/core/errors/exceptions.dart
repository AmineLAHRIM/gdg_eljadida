class RemoteException implements Exception{
  final String message;

  RemoteException({required this.message});

  @override
  String toString() {
    return message;
  }
}

class CacheException implements Exception{
  final String message;

  CacheException({required this.message});

  @override
  String toString() {
    return message;
  }
}