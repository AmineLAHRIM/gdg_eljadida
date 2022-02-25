import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Connectivity connectivity;

  Future<bool> isConnected();

  NetworkInfo(this.connectivity);
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  @override
  Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile;
  }
}
