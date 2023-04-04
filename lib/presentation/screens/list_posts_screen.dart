import 'package:flutter/material.dart';
import 'package:flutter_application_posts_api/domain/entity/post.dart';
import 'package:flutter_application_posts_api/presentation/bloc/cubit_post_list/post_list.cubit.dart';
import 'package:flutter_application_posts_api/presentation/bloc/cubit_post_list/post_list_ste.dart';
import 'package:flutter_application_posts_api/presentation/widgets/loading_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPostsScreen extends StatelessWidget {
  const ListPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListCubit, PostState>(builder: (context, state) {
      List<PostEntity> posts = [];
      if (state is PostLoading) {
        return const LoadingWidget();
      } else if (state is PostLoaded) {
        posts = state.postList;
      }
      return ListView.separated(
        itemBuilder: (context, index) {
          return Text(
            posts[index].title.toString(),
            style: const TextStyle(color: Colors.black),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: posts.length,
      );
    });
  }
}
