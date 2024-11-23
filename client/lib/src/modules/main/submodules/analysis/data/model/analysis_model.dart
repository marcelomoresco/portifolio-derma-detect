import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/disease_category_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/risk_level_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';

class AnalysisModel extends Analysis {
  const AnalysisModel({
    super.id,
    super.image,
    super.diseaseCategory,
    super.confidence,
    super.createdAt,
    super.riskLevel,
  });
  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    final disease = DiseaseCategoryMapper.fromJson(json['predict']);
    return AnalysisModel(
      id: json['id'],
      image: json['image'],
      confidence: json['confidence'],
      diseaseCategory: disease,
      createdAt: json['date'] != null ? DateTime.parse(json['date']) : null,
      riskLevel: RiskLevelMapper.getRiskLevel(disease),
    );
  }
}
