
// import 'package:api_app_project/core/api/api_consumer.dart';
// import 'package:api_app_project/core/api/api_interceptors.dart';
// import 'package:api_app_project/core/api/end_points.dart';
// import 'package:dio/dio.dart';
//
// import '../errors/exceptions.dart';

// class DioConsumer extends ApiConsumer {
//   final Dio dio;
//
//   DioConsumer(this.dio)
//   {
//     dio.options.baseUrl = EndPoints.baseUrl;
//     dio.interceptors.add(ApiInterceptors());
//     dio.interceptors.add(LogInterceptor(
//       error: true,
//       responseHeader: true,
//       responseBody: true,
//       requestBody: true,
//       requestHeader: true,
//       request: true,
//     ));
//   }
//
//   @override
//   Future delete(String path, {data, Map<String, dynamic>? queryParams , bool isFormData = false})async {
//     try
//     {
//       final response = await dio.delete(path , data:isFormData?FormData.fromMap(data) :data , queryParameters: queryParams);
//       print(response.toString());
//
//     }on DioException catch (e)
//     {
//       HandleExceptions(e);
//     }
//   }
//
//   @override
//   Future get(String path, {data, Map<String, dynamic>? queryParams , bool isFormData = false})async {
//     try
//     {
//       final response = await dio.get(path , data:isFormData?FormData.fromMap(data): data , queryParameters: queryParams);
//       print(response.toString());
//
//     }on DioException catch (e)
//     {
//       HandleExceptions(e);
//     }
//
//   }
//
//   @override
//   Future patch(String path, {data, Map<String, dynamic>? queryParams , bool isFormData = false}) async {
//     try
//     {
//       final response = await dio.patch(path , data:isFormData?FormData.fromMap(data): data , queryParameters: queryParams);
//       print(response.toString());
//
//     }on DioException catch (e)
//     {
//       HandleExceptions(e);
//     }
//   }
//
//   @override
//   Future post(String path, {data, Map<String, dynamic>? queryParams , bool isFormData = false}) async {
//     try
//     {
//       final response = await dio.post(path , data:isFormData?FormData.fromMap(data) : data , queryParameters: queryParams);
//       print(response.toString());
//
//     }on DioException catch (e)
//     {
//       HandleExceptions(e);
//     }
//   }
// }

import 'package:api_app_project/core/api/api_consumer.dart';
import 'package:api_app_project/core/api/end_points.dart';
import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import 'api_interceptors.dart';

class DioConsumer extends ApiConsumer
{
  final Dio dio;

  DioConsumer( this.dio)
{
  dio.options.baseUrl =EndPoints.baseUrl;
  dio.interceptors.add(ApiInterceptors());
  dio.interceptors.add(LogInterceptor(

    request: true,
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
  ));
}


  @override
  Future delete(String path, {data, Map<String, dynamic>? queryParams})async {
    try {
      final response = await dio.delete(path , data: data , queryParameters: queryParams);
      print (response.toString());
    }on DioException catch(e)
    {
      HandleExceptions(e);
    }
  }

  @override
  Future get(String path, {data, Map<String, dynamic>? queryParams}) async{
    try {

      final response = await dio.get(path, data: data , queryParameters: queryParams);
      print (response.toString());
    }on DioException catch(e)
    {
      HandleExceptions(e);
    }
  }

  @override
  Future patch(String path, {data, Map<String, dynamic>? queryParams})async {
    try {
      final response = await dio.patch(path,data: data , queryParameters: queryParams);
      print (response.toString());

    }on DioException catch (e)
    {
      HandleExceptions(e);
    }
  }

  @override
  Future post(String path, {data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.post(path , data: data , queryParameters: queryParams);
      print (response.toString());

    }on DioException catch(e)
    {
      HandleExceptions(e);

    }
  }


}


