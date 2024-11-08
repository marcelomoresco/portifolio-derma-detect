import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';

abstract class ProfileRemoteDatasource {
  Future<void> signOut([NoParams params]);

  Future<void> deleteAccount(String id);
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  ProfileRemoteDatasourceImpl({
    required NetworkService networkService,
  }) : _networkService = networkService;

  final NetworkService _networkService;

  @override
  Future<void> deleteAccount(String id) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<void> signOut([NoParams? params]) {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
