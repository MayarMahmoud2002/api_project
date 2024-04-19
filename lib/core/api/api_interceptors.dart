import 'package:api_app_project/cache/cache_helper.dart';
import 'package:api_app_project/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] =
    CacheHelper().getData(key: ApiKeys.token) != null
        ? 'FOODAPI ${CacheHelper().getData(key: ApiKeys.token)}'
        : null;
    super.onRequest(options, handler);
  }
}





