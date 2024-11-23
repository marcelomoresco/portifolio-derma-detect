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
    super.promptGenerated,
  });
  factory AnalysisModel.fromJson(Map<String, dynamic> json) {
    final disease = DiseaseCategoryMapper.fromJson(json['predict']);
    return AnalysisModel(
      id: json['_id'],
      image: json['image'],
      confidence: json['confidence'],
      diseaseCategory: disease,
      createdAt: json['date'] != null ? DateTime.parse(json['date']) : null,
      riskLevel: RiskLevelMapper.getRiskLevel(disease),
    );
  }

  factory AnalysisModel.fromDetailJson(Map<String, dynamic> json) {
    final disease = DiseaseCategoryMapper.fromJson(json['analysis']['predictedClass']);
    return AnalysisModel(
      id: json['analysis']['_id'],
      image: json['analysis']['image'],
      confidence: json['analysis']['confidence'],
      diseaseCategory: disease,
      createdAt: json['analysis']['createdAt'] != null ? DateTime.parse(json['analysis']['createdAt']) : null,
      riskLevel: RiskLevelMapper.getRiskLevel(disease),
      promptGenerated: json['prompt'],
    );
  }
}
