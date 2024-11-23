import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/risk_level.dart';
import 'package:equatable/equatable.dart';

class Analysis extends Equatable {
  const Analysis({
    this.id,
    this.image,
    this.diseaseCategory,
    this.confidence,
    this.createdAt,
    this.riskLevel,
    this.promptGenerated,
  });

  final String? id;
  final String? image;
  final DiseaseCategory? diseaseCategory;
  final double? confidence;
  final DateTime? createdAt;
  final RiskLevel? riskLevel;
  final String? promptGenerated;

  @override
  List<Object?> get props => [
        id,
        image,
        diseaseCategory,
        confidence,
        createdAt,
        promptGenerated,
      ];
}
