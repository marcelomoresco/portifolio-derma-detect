import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:derma_detect/src/core/services/network/interceptors/header_interceptor.dart';
import 'package:dio/io.dart';

class BaseDio extends DioForNative {
  BaseDio() {
    _configureDio();
  }

  void _configureDio() {
    options.baseUrl = "http://10.0.2.2:5001/api";

    // options.baseUrl = "http://ec2-3-89-174-210.compute-1.amazonaws.com/api";
    options.connectTimeout = const Duration(seconds: 30);
    interceptors.add(HeaderInterceptor());
    interceptors.add(
      AwesomeDioInterceptor(
        logRequestHeaders: true,
        logResponseHeaders: false,
      ),
    );
    options.sendTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
  }
}
