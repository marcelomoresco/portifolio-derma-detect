import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:derma_detect/src/core/services/network/interceptors/header_interceptor.dart';

// Mock da classe FlutterSecureStorage
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late HeaderInterceptor headerInterceptor;
  late MockFlutterSecureStorage mockSecureStorage;
  late Dio dio;

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    headerInterceptor = HeaderInterceptor();
    dio = Dio();

    // Adiciona o interceptor no Dio
    dio.interceptors.add(headerInterceptor);
  });

  test('should add Authorization header to request if token is available', () async {
    // Simula a leitura do token
    when(() => mockSecureStorage.read(key: 'user_token')).thenAnswer((_) async => 'mocked_token');

    final options = RequestOptions(
      path: '/some/path',
      baseUrl: 'http://example.com',
    );

    // Chama o onRequest diretamente para simular a requisição
    await headerInterceptor.onRequest(options, RequestInterceptorHandler());

    // Verifica se o cabeçalho de Authorization foi adicionado corretamente
    expect(options.headers['Authorization'], 'Bearer mocked_token');
  });

  test('should not add Authorization header for login or register paths', () async {
    // Simula a leitura do token
    when(() => mockSecureStorage.read(key: 'user_token')).thenAnswer((_) async => 'mocked_token');

    // Testa para URL de login
    final loginOptions = RequestOptions(
      path: '/users/login',
      baseUrl: 'http://example.com',
    );
    await headerInterceptor.onRequest(loginOptions, RequestInterceptorHandler());
    expect(loginOptions.headers['Authorization'], isNull);

    // Testa para URL de registro
    final registerOptions = RequestOptions(
      path: '/users/register',
      baseUrl: 'http://example.com',
    );
    await headerInterceptor.onRequest(registerOptions, RequestInterceptorHandler());
    expect(registerOptions.headers['Authorization'], isNull);
  });

  test('should not add Authorization header if token is null', () async {
    // Simula a leitura do token como null
    when(() => mockSecureStorage.read(key: 'user_token')).thenAnswer((_) async => null);

    final options = RequestOptions(
      path: '/some/path',
      baseUrl: 'http://example.com',
    );

    // Chama o onRequest diretamente para simular a requisição
    await headerInterceptor.onRequest(options, RequestInterceptorHandler());

    // Verifica que o cabeçalho de Authorization não foi adicionado
    expect(options.headers['Authorization'], isNull);
  });
}
