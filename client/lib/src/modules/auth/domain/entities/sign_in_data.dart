// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/utils/validators.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';

class AuthData extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;

  const AuthData({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  });

  @override
  List<Object?> get props => [name, email, password];

  bool get isValidLogin {
    if (email == null || password == null) return false;
    if (email!.isEmpty || password!.isEmpty) return false;

    final isValidPassword = PasswordValidators().isLoginPasswordValid(password);
    final isEmailValid = EmailValidator.validate(email!);

    if (isEmailValid && isValidPassword) {
      return true;
    }

    return false;
  }

  AuthData copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return AuthData(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
