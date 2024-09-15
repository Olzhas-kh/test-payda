import 'package:dio/dio.dart';

class DioInterceptor {
  final Dio api;

  Dio get getDio => api;

  DioInterceptor(this.api) {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.connectTimeout = const Duration(seconds: 30);
      options.receiveTimeout = const Duration(seconds: 30);
      options.headers['Accept'] = 'application/json';
      options.baseUrl = 'https://jsonplaceholder.typicode.com/';
      return handler.next(options);
    }, onError: (DioException error, handler) async {
      return handler.next(error);
    }));
  }
}
