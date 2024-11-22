part of 'analyze_processing_cubit.dart';

class AnalyzeProcessingState extends Equatable {
  const AnalyzeProcessingState({
    this.isAnalyzeStillProcessing = false,
    this.status = Status.initial,
    this.failure,
  });

  final Status status;
  final bool isAnalyzeStillProcessing;
  final Failure? failure;

  bool get hasFailure => status.isFailure;

  @override
  List<Object?> get props => [
        isAnalyzeStillProcessing,
        status,
        failure,
      ];

  AnalyzeProcessingState copyWith({
    Status? status,
    bool? isAnalyzeStillProcessing,
    Failure? failure,
  }) {
    return AnalyzeProcessingState(
      status: status ?? this.status,
      isAnalyzeStillProcessing: isAnalyzeStillProcessing ?? this.isAnalyzeStillProcessing,
      failure: failure ?? this.failure,
    );
  }
}
