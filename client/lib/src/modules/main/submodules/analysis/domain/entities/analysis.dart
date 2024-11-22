import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/risk_level.dart';
import 'package:equatable/equatable.dart';

class Analysis extends Equatable {
  const Analysis({
    this.image,
    this.diseaseCategory,
    this.confidence,
    this.createdAt,
    this.riskLevel,
  });

  final String? image;
  final DiseaseCategory? diseaseCategory;
  final double? confidence;
  final DateTime? createdAt;
  final RiskLevel? riskLevel;

  @override
  List<Object?> get props => [
        image,
        diseaseCategory,
        confidence,
        createdAt,
      ];
}
