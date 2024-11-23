import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/risk_level.dart';

void main() {
  group('RiskLevel Enum', () {
    test('should map enum values to correct names', () {
      expect(RiskLevel.veryHigh.name, 'Muito Alto');
      expect(RiskLevel.high.name, 'Alto');
      expect(RiskLevel.medium.name, 'Médio');
      expect(RiskLevel.low.name, 'Baixo');
    });

    test('should have all expected values', () {
      const values = RiskLevel.values;
      expect(values.length, 4);
      expect(values, contains(RiskLevel.veryHigh));
      expect(values, contains(RiskLevel.high));
      expect(values, contains(RiskLevel.medium));
      expect(values, contains(RiskLevel.low));
    });

    test('should return correct string for each enum value', () {
      final descriptions = RiskLevel.values.map((level) => level.name).toList();
      expect(descriptions, ['Muito Alto', 'Alto', 'Médio', 'Baixo']);
    });
  });
}
