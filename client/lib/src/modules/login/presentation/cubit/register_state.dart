import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.failure,
    this.isContinueButtonEnabled = false,
    this.isLogging = false,
  });
  final Failure? failure;
  final bool isContinueButtonEnabled;
  final bool isLogging;

  @override
  List<Object?> get props => [
        failure,
        isContinueButtonEnabled,
        isLogging,
      ];

  RegisterState copyWith({
    Failure? failure,
    bool? isContinueButtonEnabled,
    bool? isLogging,
  }) {
    return RegisterState(
      failure: failure ?? this.failure,
      isContinueButtonEnabled: isContinueButtonEnabled ?? this.isContinueButtonEnabled,
      isLogging: isLogging ?? this.isLogging,
    );
  }
}
