part of 'onboarding_new_analysis_cubit.dart';

class OnboardingNewAnalysisState extends Equatable {
  const OnboardingNewAnalysisState({
    this.failure,
    this.showModalPermission = false,
    this.statusPage,
  });

  final Failure? failure;
  final bool showModalPermission;
  final OnboardingNewAnalysis? statusPage;

  @override
  List<Object?> get props => [
        showModalPermission,
        failure,
        statusPage,
      ];

  OnboardingNewAnalysisState copyWith({
    Failure? failure,
    bool? showModalPermission,
    OnboardingNewAnalysis? statusPage,
  }) {
    return OnboardingNewAnalysisState(
      failure: failure ?? this.failure,
      showModalPermission: showModalPermission ?? this.showModalPermission,
      statusPage: statusPage ?? this.statusPage,
    );
  }
}

enum OnboardingNewAnalysis { authorizedCamera, unauthorizedCamera }
