import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetConnectionVerifier {
  Future<bool> hasConnection();
}

class InternetConnectionVerifierImpl implements InternetConnectionVerifier {
  final _internetConnectionChecker = InternetConnectionChecker();

  @override
  Future<bool> hasConnection() => _internetConnectionChecker.hasConnection;
}
