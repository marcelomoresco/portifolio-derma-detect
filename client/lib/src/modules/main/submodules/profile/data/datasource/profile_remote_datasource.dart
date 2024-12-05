import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ProfileRemoteDatasource {
  Future<void> signOut([NoParams params]);

  Future<void> deleteAccount([NoParams? params]);
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  ProfileRemoteDatasourceImpl({
    required NetworkService networkService,
  }) : _networkService = networkService;

  final NetworkService _networkService;

  @override
  Future<void> deleteAccount([NoParams? params]) async {
    await _networkService.delete(
      const ClientRequest(
        path: "/users/delete",
      ),
    );
  }

  @override
  Future<void> signOut([NoParams? params]) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'user-token');
  }
}
