import 'package:dartz/dartz.dart';
import 'package:flutter_application_posts_api/domain/entity/post.dart';
import '../../core/error/failure.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
