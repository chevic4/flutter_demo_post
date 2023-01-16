import 'package:flutter_application_posts_api/core/platform/network_info.dart';
import 'package:flutter_application_posts_api/data/datasourses/local/post_loca_datasource.dart';
import 'package:flutter_application_posts_api/data/datasourses/remote/post_remote_datasource.dart';
import 'package:flutter_application_posts_api/data/datasourses/repository/post_repository_imple.dart';
import 'package:flutter_application_posts_api/domain/repository/post_repository.dart';
import 'package:flutter_application_posts_api/domain/uscases/get_posts.dart';
import 'package:flutter_application_posts_api/presentation/bloc/cubit_post_list/post_list.cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async{
  //cubit
  sl.registerFactory(() => PostListCubit(getPosts: sl()));
  //usCase
  sl.registerLazySingleton(() => GetPosts(sl()));
  //Repository
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
        postRemoteDataSourse: sl(),
        postLocalDataSourse: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<PostLocalDataSourse>(
      () => PostLocalDataSourseImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<PostRemoteDataSourse>(
      () => PostRemoteDataSourseImpl(client: http.Client()));
//Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //Externat
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(()  => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
