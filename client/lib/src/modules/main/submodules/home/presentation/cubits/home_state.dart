part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.userStatus = Status.initial,
    this.lastAnalysisStatus = Status.initial,
    this.lastAnalysis = const [],
    this.failure,
    this.dermaUser,
  });

  final Failure? failure;
  final Status userStatus;
  final Status lastAnalysisStatus;
  final List<Analysis> lastAnalysis;
  final DermaUser? dermaUser;

  @override
  List<Object?> get props => [
        userStatus,
        failure,
        dermaUser,
        lastAnalysis,
        lastAnalysisStatus,
      ];

  HomeState copyWith({
    Failure? failure,
    Status? userStatus,
    DermaUser? dermaUser,
    Status? lastAnalysisStatus,
    List<Analysis>? lastAnalysis,
  }) {
    return HomeState(
      failure: failure ?? this.failure,
      userStatus: userStatus ?? this.userStatus,
      dermaUser: dermaUser ?? this.dermaUser,
      lastAnalysis: lastAnalysis ?? this.lastAnalysis,
      lastAnalysisStatus: lastAnalysisStatus ?? this.lastAnalysisStatus,
    );
  }
}
