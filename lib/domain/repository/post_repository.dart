import 'package:dartz/dartz.dart';
import 'package:flutter_application_posts_api/core/error/failure.dart';
import 'package:flutter_application_posts_api/domain/entity/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
