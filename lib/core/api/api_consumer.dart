abstract class ApiConsumer {
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  });

  Future<dynamic> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  });

  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  });

  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  });
}
