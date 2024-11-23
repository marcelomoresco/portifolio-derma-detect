import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/disease_category_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/risk_level_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/analysis_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/risk_level.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('AnalysisModel Mapper Tests', () {
    test('fromJson should map correctly', () {
      // Arrange
      final json = {
        '_id': '123',
        'image': 'base64Image',
        'confidence': 0.85,
        'predict': 'melanoma',
        'date': '2023-11-23T10:00:00Z',
      };

      // Mock behavior for DiseaseCategoryMapper and RiskLevelMapper
      const expectedDisease = DiseaseCategory.melanomaSkinCancerNeviAndMoles;
      const expectedRiskLevel = RiskLevel.high;

      when(() => DiseaseCategoryMapper.fromJson('melanoma')).thenAnswer((invocation) => expectedDisease);
      when(() => RiskLevelMapper.getRiskLevel(expectedDisease)).thenAnswer((invocation) => expectedRiskLevel);

      // Act
      final result = AnalysisModel.fromJson(json);

      // Assert
      expect(result.id, '123');
      expect(result.image, 'base64Image');
      expect(result.confidence, 0.85);
      expect(result.diseaseCategory, expectedDisease);
      expect(result.createdAt, DateTime.parse('2023-11-23T10:00:00Z'));
      expect(result.riskLevel, expectedRiskLevel);
    });

    test('fromDetailJson should map correctly', () {
      // Arrange
      final json = {
        'analysis': {
          '_id': '456',
          'image': 'base64ImageDetail',
          'confidence': 0.92,
          'predictedClass': 'acne',
          'createdAt': '2023-11-22T08:00:00Z',
        },
        'prompt': '<p>Generated Prompt</p>',
      };

      // Mock behavior for DiseaseCategoryMapper and RiskLevelMapper
      const expectedDisease = DiseaseCategory.acneAndRosaceaPhotos;
      const expectedRiskLevel = RiskLevel.low;

      // Mock DiseaseCategoryMapper and RiskLevelMapper behavior
      when(() => DiseaseCategoryMapper.fromJson('melanoma')).thenAnswer((invocation) => expectedDisease);
      when(() => RiskLevelMapper.getRiskLevel(expectedDisease)).thenAnswer((invocation) => expectedRiskLevel);

      // Act
      final result = AnalysisModel.fromDetailJson(json);

      // Assert
      expect(result.id, '456');
      expect(result.image, 'base64ImageDetail');
      expect(result.confidence, 0.92);
      expect(result.diseaseCategory, expectedDisease);
      expect(result.createdAt, DateTime.parse('2023-11-22T08:00:00Z'));
      expect(result.riskLevel, expectedRiskLevel);
      expect(result.promptGenerated, '<p>Generated Prompt</p>');
    });

    test('fromJson should handle null fields gracefully', () {
      // Arrange
      final json = {
        '_id': null,
        'image': null,
        'confidence': null,
        'predict': null,
        'date': null,
      };

      // Act
      final result = AnalysisModel.fromJson(json);

      // Assert
      expect(result.id, isNull);
      expect(result.image, isNull);
      expect(result.confidence, isNull);
      expect(result.diseaseCategory, isNull);
      expect(result.createdAt, isNull);
      expect(result.riskLevel, isNull);
    });

    test('fromDetailJson should handle null fields gracefully', () {
      // Arrange
      final json = {
        'analysis': {
          '_id': null,
          'image': null,
          'confidence': null,
          'predictedClass': null,
          'createdAt': null,
        },
        'prompt': null,
      };

      // Act
      final result = AnalysisModel.fromDetailJson(json);

      // Assert
      expect(result.id, isNull);
      expect(result.image, isNull);
      expect(result.confidence, isNull);
      expect(result.diseaseCategory, isNull);
      expect(result.createdAt, isNull);
      expect(result.riskLevel, isNull);
      expect(result.promptGenerated, isNull);
    });
  });
}
