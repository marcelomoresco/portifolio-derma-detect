import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/modules/auth/data/model/derma_user_model.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';

abstract class SharedRemoteDatasource {
  Future<DermaUser> getUserProfile();
}

class SharedRemoteDatasourceImpl implements SharedRemoteDatasource {
  SharedRemoteDatasourceImpl({
    required NetworkService networkService,
  }) : _networkService = networkService;

  final NetworkService _networkService;

  @override
  Future<DermaUser> getUserProfile() async {
    final response = await _networkService.get(
      const ClientRequest(
        path: "/users/profile",
      ),
    );
    try {
      DermaUser result = DermaUserModel.fromProfile(response.body);
      return result;
    } catch (error) {
      throw ParseDataException(message: 'DermaMapper parse error: $error');
    }
  }
}
