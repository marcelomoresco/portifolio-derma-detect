import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SharedLocalDatasource {
  Future<void> setToken(String token);

  Future<String> getToken();
}

class SharedLocalDatasourceImpl implements SharedLocalDatasource {
  SharedLocalDatasourceImpl({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _secureStorage = flutterSecureStorage;

  final FlutterSecureStorage _secureStorage;

  static const userToken = 'user_token';

  @override
  Future<String> getToken() async {
    final token = await _secureStorage.read(key: userToken);
    if (token == null) throw const DermaException(message: "Nenhum token armazenado");
    return token;
  }

  @override
  Future<void> setToken(String token) async {
    await _secureStorage.write(key: userToken, value: token);
  }
}