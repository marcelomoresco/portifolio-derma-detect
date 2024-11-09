import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HeaderInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    return handler.reject(error);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final url = '${options.baseUrl}/${options.path}';
    final header = await getHeaders(url);
    options.headers.addAll(header);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  static Future<Map<String, String>> getHeaders(String url) async {
    if (_isNotValidUrl(url)) return {};
    const secure = FlutterSecureStorage();
    String? token = await secure.read(key: "user_token");
    return {
      'Authorization': 'Bearer $token',
    };
  }

  static bool _isNotValidUrl(String url) {
    return url.contains('register') || url.contains('login');
  }
}
