import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
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

  LoginState copyWith({
    Failure? failure,
    bool? isContinueButtonEnabled,
    bool? isLogging,
  }) {
    return LoginState(
      failure: failure ?? this.failure,
      isContinueButtonEnabled: isContinueButtonEnabled ?? this.isContinueButtonEnabled,
      isLogging: isLogging ?? this.isLogging,
    );
  }
}
