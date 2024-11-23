import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_recents_analysis_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'create_analyses_usecase.dart';

void main() {
  late GetRecentsAnalysisUsecase usecase;
  late MockAnalysisRepository mockRepository;

  setUp(() {
    mockRepository = MockAnalysisRepository();
    usecase = GetRecentsAnalysisUsecase(repository: mockRepository);
  });

  final tAnalysisList = [
    const Analysis(
      id: '123',
      image: 'base64string1',
      diseaseCategory: null,
      confidence: 0.9,
      createdAt: null,
      riskLevel: null,
      promptGenerated: null,
    ),
    const Analysis(
      id: '124',
      image: 'base64string2',
      diseaseCategory: null,
      confidence: 0.85,
      createdAt: null,
      riskLevel: null,
      promptGenerated: null,
    ),
  ];

  group('GetRecentsAnalysisUsecase', () {
    test('should return a list of Analysis on success', () async {
      // Arrange
      when(() => mockRepository.getRecents()).thenAnswer((_) async => Right(tAnalysisList));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, Right(tAnalysisList));
      verify(() => mockRepository.getRecents()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository fails', () async {
      // Arrange
      const tFailure = Failure(exception: 'Error fetching recent analysis');
      when(() => mockRepository.getRecents()).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.getRecents()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
