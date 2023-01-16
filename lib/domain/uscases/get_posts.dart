import 'package:dartz/dartz.dart';
import 'package:flutter_application_posts_api/domain/repository/post_repository.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/uscases.dart';
import '../entity/post.dart';

class GetPosts extends Usecase<List<PostEntity>> {
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  //  Future<Either<Failure, List<Post>>> getAllPost() async {

  @override
  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postRepository.getPosts();
  }
}
