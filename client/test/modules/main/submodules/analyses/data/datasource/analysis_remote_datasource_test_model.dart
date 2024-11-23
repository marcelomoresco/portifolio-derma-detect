import 'package:derma_detect/src/core/services/network/dtos/client_response.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/create_analyse_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_by_id_analyse_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/datasource/analysis_remote_datasource.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  late AnalysisRemoteDatasourceImpl datasource;
  late MockNetworkService mockNetworkService;

  setUpAll(() {
    registerFallbackValue(const ClientRequest(path: ''));
    registerFallbackValue(
      MultipartFile.fromString(''),
    );
  });

  setUp(() {
    mockNetworkService = MockNetworkService();
    datasource = AnalysisRemoteDatasourceImpl(networkService: mockNetworkService);
  });

  group('AnalysisRemoteDatasourceImpl', () {
    group('create', () {
      test('should return Analysis when the call completes successfully', () async {
        // Arrange
        final file = File('test_resources/test_image.jpg');
        final params = CreateAnalysisUsecaseParams(file: file);

        final expectedResponse = {
          '_id': '123',
          'image': 'base64EncodedImage',
          'confidence': 0.9,
          'predict': 'Melanoma Skin Cancer Nevi and Moles',
          'date': '2023-11-23T10:00:00Z',
        };

        final clientResponse = ClientResponse(body: expectedResponse, statusCode: 200);

        when(() => mockNetworkService.post(any())).thenAnswer((_) async => clientResponse);

        // Act
        final result = await datasource.create(params);

        // Assert
        expect(result, isA<Analysis>());
        expect(result.id, '123');
        expect(result.image, 'base64EncodedImage');
        expect(result.confidence, 0.9);
        expect(result.diseaseCategory, isNotNull);
        expect(result.createdAt, DateTime.parse('2023-11-23T10:00:00Z'));
        verify(() => mockNetworkService.post(any())).called(1);
      });

      test('should throw ParseDataException when parsing fails', () async {
        // Arrange
        final file = File('test_resources/test_image.jpg');
        final params = CreateAnalysisUsecaseParams(file: file);

        const invalidResponse = 'Invalid JSON Response';

        const clientResponse = ClientResponse(body: invalidResponse, statusCode: 200);

        when(() => mockNetworkService.post(any())).thenAnswer((_) async => clientResponse);

        // Act & Assert
        expect(
          () async => await datasource.create(params),
          throwsA(isA<ParseDataException>()),
        );
        verify(() => mockNetworkService.post(any())).called(1);
      });

      test('should throw an exception when network call fails', () async {
        // Arrange
        final file = File('test_resources/test_image.jpg');
        final params = CreateAnalysisUsecaseParams(file: file);

        when(() => mockNetworkService.post(any())).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(
          () async => await datasource.create(params),
          throwsA(isA<Exception>()),
        );
        verify(() => mockNetworkService.post(any())).called(1);
      });
    });

    group('getById', () {
      test('should return Analysis when the call completes successfully', () async {
        // Arrange
        const params = GetByIdAnalysisUsecaseParams(id: '123');

        final expectedResponse = {
          'analysis': {
            '_id': '123',
            'image': 'base64EncodedImage',
            'confidence': 0.95,
            'predictedClass': 'Acne and Rosacea Photos',
            'createdAt': '2023-11-23T10:00:00Z',
          },
          'prompt': '<p>Generated Prompt</p>',
        };

        final clientResponse = ClientResponse(body: expectedResponse, statusCode: 200);

        when(() => mockNetworkService.get(any())).thenAnswer((_) async => clientResponse);

        // Act
        final result = await datasource.getById(params);

        // Assert
        expect(result, isA<Analysis>());
        expect(result.id, '123');
        expect(result.image, 'base64EncodedImage');
        expect(result.confidence, 0.95);
        expect(result.diseaseCategory, isNotNull);
        expect(result.createdAt, DateTime.parse('2023-11-23T10:00:00Z'));
        expect(result.promptGenerated, '<p>Generated Prompt</p>');
        verify(() => mockNetworkService.get(any())).called(1);
      });

      test('should throw ParseDataException when parsing fails', () async {
        // Arrange
        const params = GetByIdAnalysisUsecaseParams(id: '123');

        const invalidResponse = 'Invalid JSON Response';

        const clientResponse = ClientResponse(body: invalidResponse, statusCode: 200);

        when(() => mockNetworkService.get(any())).thenAnswer((_) async => clientResponse);

        // Act & Assert
        expect(
          () async => await datasource.getById(params),
          throwsA(isA<ParseDataException>()),
        );
        verify(() => mockNetworkService.get(any())).called(1);
      });

      test('should throw an exception when network call fails', () async {
        // Arrange
        const params = GetByIdAnalysisUsecaseParams(id: '123');

        when(() => mockNetworkService.get(any())).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(
          () async => await datasource.getById(params),
          throwsA(isA<Exception>()),
        );
        verify(() => mockNetworkService.get(any())).called(1);
      });
    });

    group('getAll', () {
      test('should return List<Analysis> when the call completes successfully', () async {
        // Arrange
        final expectedResponse = [
          {
            '_id': '123',
            'image': 'base64EncodedImage1',
            'confidence': 0.9,
            'predict': 'Melanoma Skin Cancer Nevi and Moles',
            'date': '2023-11-23T10:00:00Z',
          },
          {
            '_id': '124',
            'image': 'base64EncodedImage2',
            'confidence': 0.85,
            'predict': 'Acne and Rosacea Photos',
            'date': '2023-11-22T09:00:00Z',
          },
        ];

        final clientResponse = ClientResponse(body: expectedResponse, statusCode: 200);

        when(() => mockNetworkService.get(any())).thenAnswer((_) async => clientResponse);

        // Act
        final result = await datasource.getAll();

        // Assert
        expect(result, isA<List<Analysis>>());
        expect(result.length, 2);
        expect(result[0].id, '123');
        expect(result[1].id, '124');
        verify(() => mockNetworkService.get(any())).called(1);
      });

      test('should throw ParseDataException when parsing fails', () async {
        // Arrange
        const invalidResponse = 'Invalid JSON Response';

        const clientResponse = ClientResponse(body: invalidResponse, statusCode: 200);

        when(() => mockNetworkService.get(any())).thenAnswer((_) async => clientResponse);

        // Act & Assert
        expect(
          () async => await datasource.getAll(),
          throwsA(isA<ParseDataException>()),
        );
        verify(() => mockNetworkService.get(any())).called(1);
      });

      test('should throw an exception when network call fails', () async {
        // Arrange
        when(() => mockNetworkService.get(any())).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(
          () async => await datasource.getAll(),
          throwsA(isA<Exception>()),
        );
        verify(() => mockNetworkService.get(any())).called(1);
      });
    });

    group('getRecents', () {
      test('should return List<Analysis> when the call completes successfully', () async {
        // Arrange
        final expectedResponse = [
          {
            '_id': '125',
            'image': 'base64EncodedImage3',
            'confidence': 0.88,
            'predict': 'Urticaria Hives',
            'date': '2023-11-24T11:00:00Z',
          },
        ];

        final clientResponse = ClientResponse(body: expectedResponse, statusCode: 200);

        when(() => mockNetworkService.get(any())).thenAnswer((_) async => clientResponse);

        // Act
        final result = await datasource.getRecents();

        // Assert
        expect(result, isA<List<Analysis>>());
        expect(result.length, 1);
        expect(result[0].id, '125');
        verify(() => mockNetworkService.get(any())).called(1);
      });

      test('should throw ParseDataException when parsing fails', () async {
        // Arrange
        const invalidResponse = 'Invalid JSON Response';

        const clientResponse = ClientResponse(body: invalidResponse, statusCode: 200);

        when(() => mockNetworkService.get(any())).thenAnswer((_) async => clientResponse);

        // Act & Assert
        expect(
          () async => await datasource.getRecents(),
          throwsA(isA<ParseDataException>()),
        );
        verify(() => mockNetworkService.get(any())).called(1);
      });

      test('should throw an exception when network call fails', () async {
        // Arrange
        when(() => mockNetworkService.get(any())).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(
          () async => await datasource.getRecents(),
          throwsA(isA<Exception>()),
        );
        verify(() => mockNetworkService.get(any())).called(1);
      });
    });
  });
}
