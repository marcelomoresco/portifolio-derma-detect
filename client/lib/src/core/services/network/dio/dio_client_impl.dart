import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/services/network/dio/base_dio.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_response.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:dio/dio.dart';

class DioClientService implements NetworkService {
  final BaseDio dio;

  const DioClientService({
    required this.dio,
  });

  @override
  Future<ClientResponse> delete(ClientRequest clientRequest) async {
    try {
      final response = await dio.delete(
        clientRequest.path,
        data: clientRequest.data,
        queryParameters: clientRequest.headers,
        options: Options(
          headers: clientRequest.headers,
        ),
      );

      return ClientResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.response?.data['message'] ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<ClientResponse> get(ClientRequest clientRequest) async {
    try {
      final response = await dio.get(
        clientRequest.path,
        data: clientRequest.data,
        queryParameters: clientRequest.headers,
        options: Options(
          headers: clientRequest.headers,
        ),
      );

      return ClientResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.response?.data['message'] ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<ClientResponse> post(ClientRequest clientRequest) async {
    try {
      final response = await dio.post(
        clientRequest.path,
        data: clientRequest.data,
        queryParameters: clientRequest.headers,
        options: Options(headers: clientRequest.headers, contentType: "application/json"),
      );

      return ClientResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.response?.data['message'] ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<ClientResponse> put(ClientRequest clientRequest) async {
    try {
      final response = await dio.put(
        clientRequest.path,
        data: clientRequest.data,
        queryParameters: clientRequest.headers,
        options: Options(
          headers: clientRequest.headers,
        ),
      );

      return ClientResponse(
        statusCode: response.statusCode!,
        body: response.data,
      );
    } on DioException catch (e, _) {
      throw ClientException(
        message: e.response?.data['message'] ?? '',
        statusCode: e.response?.statusCode ?? 0,
      );
    }
  }
}
