import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/io.dart';

class BaseDio extends DioForNative {
  BaseDio() {
    _configureDio();
  }

  void _configureDio() {
    // options.baseUrl = "http://ec2-44-207-83-194.compute-1.amazonaws.com:8080";
    options.connectTimeout = const Duration(seconds: 30);
    interceptors.add(
      AwesomeDioInterceptor(
        logRequestHeaders: false,
        logResponseHeaders: false,
      ),
    );
    options.sendTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
  }
}
