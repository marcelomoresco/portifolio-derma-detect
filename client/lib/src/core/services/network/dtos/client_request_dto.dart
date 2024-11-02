class ClientRequest {
  final String path;
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? queryParameters;
  final Map<String, String>? headers;

  const ClientRequest({
    required this.path,
    this.data,
    this.queryParameters,
    this.headers,
  });
}
