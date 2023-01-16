import 'package:flutter/material.dart';
import 'package:flutter_application_posts_api/presentation/screens/home_screen.dart';
import 'package:flutter_application_posts_api/presentation/screens/postinfo_screen.dart';
import 'package:flutter_application_posts_api/serv_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/cubit_post_list/post_list.cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<PostListCubit>()..loadPost(),
      child: const AppRoute(),
    );
  }
}

class AppRoute extends StatelessWidget {
  const AppRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}

final routes = {
  '/': (context) => const HomeScreen(),
  '/postInfoScreen': (context) => const PostInfoScreen(),
  // '/editdata': (context, {arguments}) =>
  //     EditDataScreen(indexWorkDay: arguments)
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
      );
      return route;
    }
  }
  return null;
};
