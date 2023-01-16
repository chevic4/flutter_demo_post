import 'package:flutter_application_posts_api/core/error/exception.dart';
import 'package:flutter_application_posts_api/core/platform/network_info.dart';
import 'package:flutter_application_posts_api/data/datasourses/local/post_loca_datasource.dart';
import 'package:flutter_application_posts_api/data/datasourses/remote/post_remote_datasource.dart';
import 'package:flutter_application_posts_api/domain/entity/post.dart';
import 'package:flutter_application_posts_api/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_posts_api/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostLocalDataSourse postLocalDataSourse;
  final PostRemoteDataSourse postRemoteDataSourse;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.networkInfo,
      required this.postLocalDataSourse,
      required this.postRemoteDataSourse});

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await postRemoteDataSourse.getPosts();
        postLocalDataSourse.savePostToCache(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationPosts = await postLocalDataSourse.getPostsFromCache();
        return Right(locationPosts);
      } on CachException {
        return Left(CacheFailure());
      }
    }
  }
}
