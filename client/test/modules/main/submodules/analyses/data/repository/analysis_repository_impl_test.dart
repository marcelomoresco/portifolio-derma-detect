import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/datasource/analysis_remote_datasource.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/repository/analysis_repository_impl.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/create_analyse_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_by_id_analyse_usecase.dart';
import 'dart:io';

class MockAnalysisRemoteDatasource extends Mock implements AnalysisRemoteDatasource {}

void main() {
  late AnalysisRepositoryImpl repository;
  late MockAnalysisRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockAnalysisRemoteDatasource();
    repository = AnalysisRepositoryImpl(datasource: mockDatasource);
  });

  const tAnalysis = Analysis(
    id: '123',
    image: 'base64string',
    diseaseCategory: null,
    confidence: 0.8,
    createdAt: null,
    riskLevel: null,
    promptGenerated: null,
  );

  final tAnalysisList = [tAnalysis];

  final tCreateParams = CreateAnalysisUsecaseParams(file: File('path/to/file'));
  const tGetByIdParams = GetByIdAnalysisUsecaseParams(id: '123');

  group('AnalysisRepositoryImpl', () {
    test('should return List<Analysis> when getAll is successful', () async {
      // Arrange
      when(() => mockDatasource.getAll()).thenAnswer((_) async => tAnalysisList);

      // Act
      final result = await repository.getAll();

      // Assert
      expect(result, Right(tAnalysisList));
      verify(() => mockDatasource.getAll()).called(1);
    });

    test('should return Failure when getAll throws an error', () async {
      // Arrange
      when(() => mockDatasource.getAll()).thenThrow(Exception('Error fetching all analyses'));

      // Act
      final result = await repository.getAll();

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockDatasource.getAll()).called(1);
    });

    test('should return Analysis when create is successful', () async {
      // Arrange
      when(() => mockDatasource.create(tCreateParams)).thenAnswer((_) async => tAnalysis);

      // Act
      final result = await repository.create(tCreateParams);

      // Assert
      expect(result, const Right(tAnalysis));
      verify(() => mockDatasource.create(tCreateParams)).called(1);
    });

    test('should return Failure when create throws an error', () async {
      // Arrange
      when(() => mockDatasource.create(tCreateParams)).thenThrow(Exception('Error creating analysis'));

      // Act
      final result = await repository.create(tCreateParams);

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockDatasource.create(tCreateParams)).called(1);
    });

    test('should return Analysis when getById is successful', () async {
      // Arrange
      when(() => mockDatasource.getById(tGetByIdParams)).thenAnswer((_) async => tAnalysis);

      // Act
      final result = await repository.getById(tGetByIdParams);

      // Assert
      expect(result, const Right(tAnalysis));
      verify(() => mockDatasource.getById(tGetByIdParams)).called(1);
    });

    test('should return Failure when getById throws an error', () async {
      // Arrange
      when(() => mockDatasource.getById(tGetByIdParams)).thenThrow(Exception('Error fetching analysis by ID'));

      // Act
      final result = await repository.getById(tGetByIdParams);

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockDatasource.getById(tGetByIdParams)).called(1);
    });

    test('should return List<Analysis> when getRecents is successful', () async {
      // Arrange
      when(() => mockDatasource.getRecents()).thenAnswer((_) async => tAnalysisList);

      // Act
      final result = await repository.getRecents();

      // Assert
      expect(result, Right(tAnalysisList));
      verify(() => mockDatasource.getRecents()).called(1);
    });

    test('should return Failure when getRecents throws an error', () async {
      // Arrange
      when(() => mockDatasource.getRecents()).thenThrow(Exception('Error fetching recent analyses'));

      // Act
      final result = await repository.getRecents();

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockDatasource.getRecents()).called(1);
    });
  });
}
