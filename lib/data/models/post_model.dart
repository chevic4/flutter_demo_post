import 'package:flutter_application_posts_api/domain/entity/post.dart';

class PostModel extends PostEntity {
  const PostModel({
    required thumbnail,
    required title,
    required ups,
    required selftext,
  }) : super(
          thumbnail: thumbnail,
          title: title,
          ups: ups,
          selftext: selftext,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      thumbnail: json['thumbnail'].toString(),
      title: json['title'].toString(),
      ups: json['ups'].toString(),
      selftext: json['selftext'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
      'title': title,
      'ups': ups,
      'selftext': selftext,
    };
  }
}
