import 'package:derma_detect/src/core/services/network/dio/dio_client_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/dio/base_dio.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:dio/dio.dart';

class MockBaseDio extends Mock implements BaseDio {}

void main() {
  late DioClientService dioClientService;
  late MockBaseDio mockDio;

  setUp(() {
    mockDio = MockBaseDio();
    dioClientService = DioClientService(dio: mockDio);
  });

  group('DioClientService', () {
    const clientRequest = ClientRequest(
      path: "/test",
      data: {"key": "value"},
      headers: {"Authorization": "Bearer token"},
    );

    test('should return a valid response for GET request', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/test'),
        statusCode: 200,
        data: {'key': 'value'},
      );
      when(() => mockDio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result = await dioClientService.get(clientRequest);

      expect(result.statusCode, 200);
      expect(result.body, {'key': 'value'});

      verify(() => mockDio.get('/test', queryParameters: {'Authorization': 'Bearer token'})).called(1);
    });

    test('should return a valid response for POST request', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/test'),
        statusCode: 200,
        data: {'key': 'value'},
      );
      when(() => mockDio.post(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result = await dioClientService.post(clientRequest);

      expect(result.statusCode, 200);
      expect(result.body, {'key': 'value'});

      verify(() => mockDio.post('/test', data: {'key': 'value'}, queryParameters: {'Authorization': 'Bearer token'}))
          .called(1);
    });

    test('should throw ClientException for DioException during GET request', () async {
      when(() => mockDio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '/test')));

      expect(() async => await dioClientService.get(clientRequest), throwsA(isA<ClientException>()));
    });

    test('should throw ClientException for DioException during POST request', () async {
      when(() => mockDio.post(any(), data: any(named: 'data'), queryParameters: any(named: 'queryParameters')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '/test')));

      expect(() async => await dioClientService.post(clientRequest), throwsA(isA<ClientException>()));
    });

    test('should return a valid response for DELETE request', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/test'),
        statusCode: 200,
        data: {'key': 'value'},
      );
      when(() => mockDio.delete(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result = await dioClientService.delete(clientRequest);

      expect(result.statusCode, 200);
      expect(result.body, {'key': 'value'});

      verify(() => mockDio.delete('/test', queryParameters: {'Authorization': 'Bearer token'})).called(1);
    });

    test('should throw ClientException for DioException during DELETE request', () async {
      when(() => mockDio.delete(any(), queryParameters: any(named: 'queryParameters')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '/test')));

      expect(() async => await dioClientService.delete(clientRequest), throwsA(isA<ClientException>()));
    });
  });
}
