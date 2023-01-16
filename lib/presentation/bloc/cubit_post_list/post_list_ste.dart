import 'package:equatable/equatable.dart';
import 'package:flutter_application_posts_api/domain/entity/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostEmpty extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoaded extends PostState {
  final List<PostEntity> postList;

  PostLoaded(this.postList);

  @override
  List<Object> get props => [postList];
}

class PostError extends PostState {
  final String errorMessage;

  PostError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
