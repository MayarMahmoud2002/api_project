import 'package:api_app_project/core/api/api_consumer.dart';
import 'package:api_app_project/core/api/api_interceptors.dart';
import 'package:api_app_project/core/api/end_points.dart';
import 'package:dio/dio.dart';
import '../errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio})
  {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }

  @override
  Future delete(String path,
      {dynamic data, Map<String, dynamic>? queryParams ,  bool isFormData = false}) async {
    try {
      final response = await dio.delete(path,  data:isFormData? FormData.fromMap(data) : data, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e)
    {
      HandleExceptions(e);
    }
  }

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParams})async {
    try {
      final response = await dio.get(path, data: data, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e)
    {
      HandleExceptions(e);
    }
  }

  @override
  Future patch(String path, {dynamic data, Map<String, dynamic>? queryParams , bool isFormData = false})async {
    try {
      final response = await dio.patch(path, data:isFormData? FormData.fromMap(data) : data, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e)
    {
      HandleExceptions(e);
    }
  }

  @override
  Future post(String path, {dynamic data, Map<String, dynamic>? queryParams, bool isFormData = false})async {
    try {
      final response = await dio.post(path, data:data, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e)
    {
      HandleExceptions(e);
    }
  }
}
