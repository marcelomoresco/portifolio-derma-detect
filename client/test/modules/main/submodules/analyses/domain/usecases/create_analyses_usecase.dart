import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/create_analyse_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/repository/analysis_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAnalysisRepository extends Mock implements AnalysisRepository {}

void main() {
  late CreateAnalysisUsecase usecase;
  late MockAnalysisRepository mockRepository;

  setUp(() {
    mockRepository = MockAnalysisRepository();
    usecase = CreateAnalysisUsecase(repository: mockRepository);
  });

  final tParams = CreateAnalysisUsecaseParams(file: File('path/to/file'));

  const tAnalysis = Analysis(
    id: '123',
    image: 'base64string',
    diseaseCategory: null,
    confidence: 0.8,
    createdAt: null,
    riskLevel: null,
    promptGenerated: null,
  );

  test('should return Analysis on success', () async {
    // Arrange
    when(() => mockRepository.create(tParams)).thenAnswer((_) async => const Right(tAnalysis));

    // Act
    final result = await usecase(tParams);

    // Assert
    expect(result, const Right(tAnalysis));
    verify(() => mockRepository.create(tParams)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return Failure on error', () async {
    // Arrange
    const tFailure = Failure(exception: 'Error creating analysis');
    when(() => mockRepository.create(tParams)).thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await usecase(tParams);

    // Assert
    expect(result, const Left(tFailure));
    verify(() => mockRepository.create(tParams)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
