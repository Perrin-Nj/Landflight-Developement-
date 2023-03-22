import 'package:flutter/material.dart';
import 'package:landflight/controller/MenuController.dart';
import 'package:landflight/controller/SearchController.dart';
import 'package:landflight/vues/onboarding/choix_langue.dart';
import 'package:landflight/vues/onboarding/onboarding1.dart';
import 'package:provider/provider.dart';

import 'controller/ControllerComment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return CommentController();
        }),
        ChangeNotifierProvider(create: (_) {
          return menuController();
        }),
        ChangeNotifierProvider(create: (_) {
          return SearchController();
        }),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ChoixLangue(),
        ),
      ),
    );
  }
}
