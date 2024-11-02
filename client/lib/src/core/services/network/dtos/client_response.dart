class ClientResponse {
  final int statusCode;
  final dynamic body;

  const ClientResponse({
    required this.statusCode,
    required this.body,
  });
}
