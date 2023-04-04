import 'package:flutter_application_posts_api/domain/uscases/get_posts.dart';
import 'package:flutter_application_posts_api/presentation/bloc/cubit_post_list/post_list_ste.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListCubit extends Cubit<PostState> {
  GetPosts getPosts;
  PostListCubit({required this.getPosts}) : super(PostEmpty());

  void loadPost() async {
    if (state is PostLoading) return;

    final failureOrPosts = await getPosts();
    failureOrPosts.fold((error) => const PostError('error!'), (listPosts) {
      emit(PostLoaded(listPosts));
    });
  }
}
