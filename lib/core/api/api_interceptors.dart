
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor
{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZTcxMjM5MzJhYTkxYTRlNzg5MTdlZSIsImVtYWlsIjoibWFobW91ZG1heWFyMjUxQGdtYWlsLmNvbSIsIm5hbWUiOiJtYXlhciIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEwMzczMDYzfQ.XM5_1U5N_r5KtRlUHlRUKXX6CNofKMpMcc01SM4K5WM';
    super.onRequest(options, handler);
  }
}