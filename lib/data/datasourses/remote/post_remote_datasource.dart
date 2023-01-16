import 'dart:convert';
import 'package:flutter_application_posts_api/core/error/exception.dart';
import 'package:flutter_application_posts_api/data/models/post_model.dart';
import 'package:flutter_application_posts_api/data/models/responce_model.dart';
import 'package:http/http.dart' as http;

const uri = 'https://www.reddit.com/r/flutterdev/new.json';

abstract class PostRemoteDataSourse {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataSourseImpl implements PostRemoteDataSourse {
  final http.Client client;

  PostRemoteDataSourseImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonAll = jsonDecode(response.body);

      final jsonBody = jsonAll['data'] as Map<String, dynamic>;

      final cache = jsonBody['children'] as List<dynamic>;

      List<PostModel> result = [];
      for (final i in cache) {
        var cache = PostModel.fromJson(i['data']);
        result.add(cache);
      }

      return result;
    } else {
      throw ServerException();
    }
  }
}
