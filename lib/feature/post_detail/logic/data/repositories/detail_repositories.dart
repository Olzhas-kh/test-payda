import 'package:dio/dio.dart';
import 'package:test_payda/feature/post_detail/logic/data/datasources/detail_datasources.dart';
import 'package:test_payda/feature/post_detail/logic/data/models/comment_model.dart';
import 'package:test_payda/feature/post_detail/logic/data/models/user_model.dart';

abstract class DetailRepository {
  Future<UserModel> getUser(int userId);
  Future<List<CommentModel>> getComment(int postId);
}

class DetailRepositoryImpl implements DetailRepository {
  final DetailDataSource detailDataSource;

  DetailRepositoryImpl(this.detailDataSource);

  @override
  Future<UserModel> getUser(int userId) async {
    Response response = await detailDataSource.getUser(userId);
    return UserModel.fromJson(response.data);
  }

  @override
  Future<List<CommentModel>> getComment(int postId) async {
    Response response = await detailDataSource.getComment(postId);
    List<dynamic> jsonData = response.data;
    return jsonData.map((json) => CommentModel.fromJson(json)).toList();
  }
}
