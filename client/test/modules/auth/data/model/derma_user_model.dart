import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/modules/auth/data/model/derma_user_model.dart';

void main() {
  group('DermaUserModel', () {
    const tJsonComplete = {
      'user': {
        'id': '123',
        'name': 'User One',
        'email': 'user@example.com',
      },
      'token': 'token123',
    };

    const tJsonProfile = {
      'user': {
        'id': '123',
        'name': 'User One',
        'email': 'user@example.com',
      },
    };

    const tDermaUserModelComplete = DermaUserModel(
      id: '123',
      name: 'User One',
      email: 'user@example.com',
      token: 'token123',
    );

    const tDermaUserModelProfile = DermaUserModel(
      id: '123',
      name: 'User One',
      email: 'user@example.com',
    );

    test('fromJson should correctly map from valid JSON with token', () {
      // Act
      final result = DermaUserModel.fromJson(tJsonComplete);

      // Assert
      expect(result, equals(tDermaUserModelComplete));
      expect(result.token, equals('token123'));
    });

    test('fromJson should throw if required fields are missing', () {
      // Arrange
      final invalidJson = {
        'user': {
          'id': 123,
          'email': 'user@example.com',
        },
      };

      // Act & Assert
      expect(
        () => DermaUserModel.fromJson(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });

    test('fromJson should throw if JSON structure is invalid', () {
      // Arrange
      final invalidJson = {
        'id': 123,
        'name': 'User One',
        'email': 'user@example.com',
        'token': 'token123',
      };

      // Act & Assert
      expect(
        () => DermaUserModel.fromJson(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });

    test('fromProfile should correctly map from valid JSON without token', () {
      // Act
      final result = DermaUserModel.fromProfile(tJsonProfile);

      // Assert
      expect(result, equals(tDermaUserModelProfile));
      expect(result.token, isNull);
    });

    test('fromProfile should throw if required fields are missing', () {
      // Arrange
      final invalidJson = {
        'user': {
          'name': 123,
        },
      };

      // Act & Assert
      expect(
        () => DermaUserModel.fromProfile(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });

    test('fromProfile should throw if JSON structure is invalid', () {
      // Arrange
      final invalidJson = {
        'id': 123,
        'name': 'User One',
        'email': 'user@example.com',
      };

      // Act & Assert
      expect(
        () => DermaUserModel.fromProfile(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });

    test('Equality of models should work correctly', () {
      // Act & Assert
      expect(tDermaUserModelComplete, equals(tDermaUserModelComplete));
      expect(tDermaUserModelComplete, isNot(equals(tDermaUserModelProfile)));
    });
  });
}
