import 'package:dio/dio.dart';
import 'package:test_payda/core/dio_interceptor/dio_interceptor.dart';

abstract class DetailDataSource {
  Future<Response> getUser(int userId);
  Future<Response> getComment(int postId);
}

class DetailDataSourceImpl implements DetailDataSource {
  Dio get dio => DioInterceptor(Dio()).getDio;

  @override
  Future<Response> getUser(int userId) async {
    Response response = await dio.get(
      'users/$userId',
    );
    return response;
  }

  @override
  Future<Response> getComment(int postId) async {
    Response response = await dio.get(
      'posts/$postId/comments',
    );
    return response;
  }
}
