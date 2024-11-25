import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/disease_category_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';

void main() {
  group('DiseaseCategoryMapper', () {
    group('fromJson', () {
      test('should return correct DiseaseCategory for valid category strings', () {
        // Arrange
        const categoryString = 'Melanoma Skin Cancer Nevi and Moles';
        const expectedCategory = DiseaseCategory.melanomaSkinCancerNeviAndMoles;

        // Act
        final result = DiseaseCategoryMapper.fromJson(categoryString);

        // Assert
        expect(result, expectedCategory);
      });

      test('should return null for unknown category strings', () {
        // Arrange
        const categoryString = 'Unknown Category';

        // Act
        final result = DiseaseCategoryMapper.fromJson(categoryString);

        // Assert
        expect(result, isNull);
      });
    });

    group('translate', () {
      test('should return correct translation for valid DiseaseCategory', () {
        // Arrange
        const category = DiseaseCategory.acneAndRosaceaPhotos;
        const expectedTranslation = 'Acne e Rosácea';

        // Act
        final result = DiseaseCategoryMapper.translate(category);

        // Assert
        expect(result, expectedTranslation);
      });
    });
  });
}
