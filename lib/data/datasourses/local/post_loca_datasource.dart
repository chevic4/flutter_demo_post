import 'dart:convert';
import 'package:flutter_application_posts_api/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/post_model.dart';

const cacheName = 'CachePosts';

abstract class PostLocalDataSourse {
  Future<List<PostModel>> getPostsFromCache();
  Future<void> savePostToCache(List<PostModel> posts);
}

class PostLocalDataSourseImpl implements PostLocalDataSourse {
  final SharedPreferences sharedPreferences;
  PostLocalDataSourseImpl({required this.sharedPreferences});

  @override
  Future<List<PostModel>> getPostsFromCache() {
    final jsonData = sharedPreferences.getStringList(cacheName);
    if (jsonData!.isNotEmpty) {
      return Future.value(
          jsonData.map((e) => PostModel.fromJson(json.decode(e))).toList());
    } else {
      throw CachException();
    }
  }

  @override
  Future<void> savePostToCache(List<PostModel> posts) async {
    final List<String> dataJson =
        posts.map((e) => json.encode(e.toJson())).toList();
    await sharedPreferences.setStringList(cacheName, dataJson);
  }
}
