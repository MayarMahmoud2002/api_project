abstract class ApiConsumer {
  Future<dynamic> post(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryparams,
  });

  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparams,
  });

  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparams,
  });

  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparams,
  });
}
