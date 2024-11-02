import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_response.dart';

abstract interface class NetworkService {
  Future<ClientResponse> get(ClientRequest clientRequest);
  Future<ClientResponse> post(ClientRequest clientRequest);
  Future<ClientResponse> put(ClientRequest clientRequest);
  Future<ClientResponse> delete(ClientRequest clientRequest);
}
