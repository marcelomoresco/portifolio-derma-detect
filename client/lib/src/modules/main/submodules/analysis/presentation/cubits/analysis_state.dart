part of 'analysis_cubit.dart';

class AnalysisState extends Equatable {
  const AnalysisState({
    this.analysisStatus = Status.initial,
    this.analysis = const [],
    this.failure,
  });
  final Status analysisStatus;
  final List<Analysis> analysis;
  final Failure? failure;

  @override
  List<Object?> get props => [
        analysisStatus,
        analysis,
        failure,
      ];

  AnalysisState copyWith({
    Failure? failure,
    Status? analysisStatus,
    List<Analysis>? analysis,
  }) {
    return AnalysisState(
      failure: failure ?? this.failure,
      analysis: analysis ?? this.analysis,
      analysisStatus: analysisStatus ?? this.analysisStatus,
    );
  }
}
