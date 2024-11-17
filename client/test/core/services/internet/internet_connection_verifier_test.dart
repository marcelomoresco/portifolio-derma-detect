import 'package:derma_detect/src/core/services/internet/internet_connection_verifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  late InternetConnectionVerifierImpl internetConnectionVerifier;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    internetConnectionVerifier = InternetConnectionVerifierImpl();
  });

  group('hasConnection', () {
    test('should return true when internet connection is available', () async {
      when(() => mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);

      final result = await internetConnectionVerifier.hasConnection();

      expect(result, true);

      verify(() => mockInternetConnectionChecker.hasConnection).called(1);
    });

    test('should return false when internet connection is not available', () async {
      when(() => mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => false);

      final result = await internetConnectionVerifier.hasConnection();

      expect(result, false);

      verify(() => mockInternetConnectionChecker.hasConnection).called(1);
    });
  });
}
