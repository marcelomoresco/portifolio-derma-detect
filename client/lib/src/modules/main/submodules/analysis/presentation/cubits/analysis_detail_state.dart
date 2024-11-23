part of 'analysis_detail_cubit.dart';

class AnalysisDetailState extends Equatable {
  const AnalysisDetailState({
    this.analysisStatus = Status.initial,
    required this.analysis,
    this.failure,
  });
  final Status analysisStatus;
  final Analysis analysis;
  final Failure? failure;

  @override
  List<Object?> get props => [
        analysisStatus,
        analysis,
        failure,
      ];

  AnalysisDetailState copyWith({
    Failure? failure,
    Status? analysisStatus,
    Analysis? analysis,
  }) {
    return AnalysisDetailState(
      failure: failure ?? this.failure,
      analysis: analysis ?? this.analysis,
      analysisStatus: analysisStatus ?? this.analysisStatus,
    );
  }
}
