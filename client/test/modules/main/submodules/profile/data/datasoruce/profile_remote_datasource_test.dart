import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_response.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/data/datasource/profile_remote_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNetworkService extends Mock implements NetworkService {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late ProfileRemoteDatasourceImpl datasource;
  late MockNetworkService mockNetworkService;
  late MockFlutterSecureStorage mockFlutterSecureStorage;

  setUp(() {
    mockNetworkService = MockNetworkService();
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    datasource = ProfileRemoteDatasourceImpl(
      networkService: mockNetworkService,
    );
  });

  group('deleteAccount', () {
    const request = ClientRequest(path: "/users/delete");
    registerFallbackValue(request);
    test('should call networkService.delete when deleteAccount is called', () async {
      // Arrange
      when(() => mockNetworkService.delete(request))
          .thenAnswer((_) async => const ClientResponse(statusCode: 200, body: {}));

      // Act
      await datasource.deleteAccount();

      // Assert
      verify(() => mockNetworkService.delete(request)).called(1);
    });
  });
}
