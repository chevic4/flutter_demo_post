import 'package:dartz/dartz.dart';
import 'package:flutter_application_posts_api/core/error/failure.dart';
import 'package:flutter_application_posts_api/core/usecase/uscases.dart';
import 'package:flutter_application_posts_api/domain/entity/post.dart';
import 'package:flutter_application_posts_api/domain/repository/post_repository.dart';

class GetPosts extends Usecase<List<PostEntity>> {
  final PostRepository postRepository;

  GetPosts(this.postRepository);
  @override
  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postRepository.getPosts();
  }
}
