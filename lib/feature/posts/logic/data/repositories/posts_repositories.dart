import 'package:dio/dio.dart';
import 'package:test_payda/feature/posts/logic/data/datasources/posts_datasource.dart';
import 'package:test_payda/feature/posts/logic/data/models/posts_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}

class PostsRepositoryImpl implements PostsRepository {
  final PostsDataSource postsDataSource;

  PostsRepositoryImpl(this.postsDataSource);

  @override
  Future<List<PostModel>> getPosts() async {
    Response response = await postsDataSource.getPosts();
     List<dynamic> jsonData = response.data;
    return jsonData.map((json) => PostModel.fromJson(json)).toList();
  }
}
