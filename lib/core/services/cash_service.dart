import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_payda/feature/posts/logic/data/models/posts_model.dart';

class CacheService {
  static const String _postsKey = 'cached_posts';

  Future<void> savePosts(List<PostModel> posts) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonPosts = posts.map((post) => post.toJson()).toList();
    await prefs.setString(_postsKey, jsonEncode(jsonPosts));
  }

  Future<List<PostModel>> getCachedPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_postsKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    }
    return [];
  }
}
