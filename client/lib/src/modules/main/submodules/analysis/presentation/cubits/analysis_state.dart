// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'analysis_cubit.dart';

class AnalysisState extends Equatable {
  const AnalysisState({
    this.analysisStatus = Status.initial,
    this.analysis = const [],
    this.failure,
    this.dermaUser,
  });
  final Status analysisStatus;
  final List<Analysis> analysis;
  final Failure? failure;
  final DermaUser? dermaUser;

  @override
  List<Object?> get props => [
        analysisStatus,
        analysis,
        failure,
        dermaUser,
      ];

  AnalysisState copyWith({
    Failure? failure,
    Status? analysisStatus,
    List<Analysis>? analysis,
    DermaUser? dermaUser,
  }) {
    return AnalysisState(
      failure: failure ?? this.failure,
      analysis: analysis ?? this.analysis,
      analysisStatus: analysisStatus ?? this.analysisStatus,
      dermaUser: dermaUser ?? this.dermaUser,
    );
  }
}
