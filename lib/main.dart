import 'package:flutter/material.dart';
import 'package:flutter_application_posts_api/app.dart';
import 'package:flutter_application_posts_api/serv_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}

/*
https://docs.google.com/document/d/1EBeIszgKmnzo8e5uDOres6Lj3-Gijhf-R1fC6-ClsL0/edit
 */