import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DermaUser', () {
    test('supports value comparison', () {
      const user1 = DermaUser(
        id: '1',
        email: 'user@example.com',
        name: 'User One',
        token: 'token123',
      );

      const user2 = DermaUser(
        id: '1',
        email: 'user@example.com',
        name: 'User One',
        token: 'token123',
      );

      expect(user1, equals(user2));
    });

    test('two users with different emails are not equal', () {
      const user1 = DermaUser(
        id: '1',
        email: 'user1@example.com',
        name: 'User One',
        token: 'token123',
      );

      const user2 = DermaUser(
        id: '2',
        email: 'user2@example.com',
        name: 'User One',
        token: 'token123',
      );

      expect(user1, isNot(equals(user2)));
    });

    test('allows token to be null', () {
      const user1 = DermaUser(
        id: '1',
        email: 'user@example.com',
        name: 'User One',
        token: null,
      );

      const user2 = DermaUser(
        id: '1',
        email: 'user@example.com',
        name: 'User One',
        token: null,
      );

      expect(user1, equals(user2));
      expect(user1.token, isNull);
    });
  });
}
