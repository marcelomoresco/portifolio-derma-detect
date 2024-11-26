import 'package:derma_detect/src/core/utils/validators.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPasswordValidators extends Mock implements PasswordValidators {}

void main() {
  group('AuthData', () {
    late MockPasswordValidators mockValidators;

    setUp(() {
      mockValidators = MockPasswordValidators();

      when(() => mockValidators.isLoginPasswordValid(any())).thenReturn(true);
    });

    test('supports value comparison', () {
      const auth1 = AuthData(
        name: 'User One',
        email: 'user@example.com',
        password: 'password123',
        confirmPassword: 'password123',
      );

      const auth2 = AuthData(
        name: 'User One',
        email: 'user@example.com',
        password: 'password123',
        confirmPassword: 'password123',
      );

      expect(auth1, equals(auth2));
    });

    test('isValidLogin returns true for valid email and password', () {
      const auth = AuthData(
        email: 'user@example.com',
        password: 'Password123!',
      );

      when(() => mockValidators.isLoginPasswordValid(auth.password)).thenReturn(true);

      expect(auth.isValidLogin, isTrue);
    });

    test('isValidLogin returns false for invalid email', () {
      // Email inválido
      const auth = AuthData(
        email: 'invalid-email',
        password: 'password123',
      );

      when(() => mockValidators.isLoginPasswordValid(auth.password)).thenReturn(true);

      expect(auth.isValidLogin, isFalse);
    });

    test('isValidLogin returns false for invalid password', () {
      // Configura a validação da senha como falsa
      const auth = AuthData(
        email: 'user@example.com',
        password: '123',
      );

      when(() => mockValidators.isLoginPasswordValid(auth.password)).thenReturn(false);

      expect(auth.isValidLogin, isFalse);
    });

    test('isValidLogin returns false for null email or password', () {
      const auth1 = AuthData(
        email: null,
        password: 'password123',
      );

      const auth2 = AuthData(
        email: 'user@example.com',
        password: null,
      );

      expect(auth1.isValidLogin, isFalse);
      expect(auth2.isValidLogin, isFalse);
    });

    test('copyWith creates a copy with updated values', () {
      const auth = AuthData(
        name: 'User One',
        email: 'user@example.com',
        password: 'password123',
        confirmPassword: 'password123',
      );

      final updatedAuth = auth.copyWith(
        email: 'newuser@example.com',
        password: 'newpassword456',
      );

      expect(updatedAuth.name, equals('User One'));
      expect(updatedAuth.email, equals('newuser@example.com'));
      expect(updatedAuth.password, equals('newpassword456'));
      expect(updatedAuth.confirmPassword, equals('password123'));
    });

    test('copyWith keeps original values if not updated', () {
      const auth = AuthData(
        name: 'User One',
        email: 'user@example.com',
        password: 'password123',
        confirmPassword: 'password123',
      );

      final updatedAuth = auth.copyWith();

      expect(updatedAuth, equals(auth));
    });
  });
}
