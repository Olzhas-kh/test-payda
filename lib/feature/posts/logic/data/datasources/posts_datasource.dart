
import 'package:dio/dio.dart';
import 'package:test_payda/core/dio_interceptor/dio_interceptor.dart';

abstract class PostsDataSource {
  Future<Response> getPosts();
}

class PostsDataSourceImpl implements PostsDataSource {
  Dio get dio => DioInterceptor(Dio()).getDio;

  @override
  Future<Response> getPosts() async {
    Response response = await dio.get(
      'posts',
    );
    return response;
  }
}
