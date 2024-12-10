import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/services/network/interceptors/header_interceptor.dart';
import 'package:derma_detect/src/core/services/network/dio/base_dio.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

class MockHeaderInterceptor extends Mock implements HeaderInterceptor {}

class MockAwesomeDioInterceptor extends Mock implements AwesomeDioInterceptor {}

void main() {
  late BaseDio baseDio;

  setUp(() {
    baseDio = BaseDio();
  });

  test('should configure Dio correctly', () {
    expect(baseDio.options.baseUrl, 'http://ec2-3-89-174-210.compute-1.amazonaws.com/api');

    expect(baseDio.options.connectTimeout, const Duration(seconds: 30));

    expect(baseDio.options.sendTimeout, const Duration(seconds: 30));

    expect(baseDio.options.receiveTimeout, const Duration(seconds: 30));
  });

  test('should add interceptors to Dio', () {
    final headerInterceptor = MockHeaderInterceptor();
    final awesomeInterceptor = MockAwesomeDioInterceptor();

    baseDio.interceptors.add(headerInterceptor);
    baseDio.interceptors.add(awesomeInterceptor);

    expect(baseDio.interceptors.contains(headerInterceptor), true);

    expect(baseDio.interceptors.contains(awesomeInterceptor), true);
  });

  test('should contain the right interceptors after configuration', () {
    expect(baseDio.interceptors.any((interceptor) => interceptor is HeaderInterceptor), true);

    expect(baseDio.interceptors.any((interceptor) => interceptor is AwesomeDioInterceptor), true);
  });
}
