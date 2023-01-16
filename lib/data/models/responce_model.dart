import 'package:flutter_application_posts_api/data/models/post_model.dart';

class RespoModel {
  RespoModel({
    required this.kind,
    required this.data,
  });
  late final String kind;
  late final List<PostModel> data;

  RespoModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = List.from(json['data']).map((e) => PostModel.fromJson(e)).toList();
  }
}
