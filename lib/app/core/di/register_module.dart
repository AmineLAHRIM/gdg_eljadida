
import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule{

  @singleton
  Connectivity get connectivity;
}