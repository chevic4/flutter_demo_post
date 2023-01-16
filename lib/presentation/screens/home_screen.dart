import 'package:flutter/material.dart';
import 'package:flutter_application_posts_api/presentation/screens/list_posts_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListPostsScreen(),
    );
  }
}

