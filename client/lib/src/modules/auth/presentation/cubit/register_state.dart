import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.failure,
    this.isContinueButtonEnabled = false,
    this.isContinueButtonLoading = false,
    this.authData = const AuthData(),
    this.showPassword = false,
  });
  final Failure? failure;
  final bool isContinueButtonEnabled;
  final bool isContinueButtonLoading;
  final AuthData? authData;
  final bool showPassword;

  @override
  List<Object?> get props => [
        failure,
        isContinueButtonEnabled,
        isContinueButtonLoading,
        authData,
        showPassword,
      ];

  RegisterState copyWith({
    Failure? failure,
    bool? isContinueButtonEnabled,
    bool? isContinueButtonLoading,
    AuthData? authData,
    bool? showPassword,
  }) {
    return RegisterState(
      failure: failure ?? this.failure,
      isContinueButtonEnabled: isContinueButtonEnabled ?? this.isContinueButtonEnabled,
      isContinueButtonLoading: isContinueButtonLoading ?? this.isContinueButtonLoading,
      authData: authData ?? this.authData,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
