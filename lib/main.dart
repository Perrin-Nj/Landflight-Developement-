import 'package:flutter/material.dart';
import 'package:landflight/vues/onboarding/choix_langue.dart';
import 'package:landflight/vues/onboarding/onboarding1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChoixLangue(),
      ),
    );
  }
}
