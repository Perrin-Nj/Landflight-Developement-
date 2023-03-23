import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:landflight/controller/MenuController.dart';
import 'package:landflight/controller/SearchController.dart';
import 'package:landflight/vues/authentification/login.dart';
import 'package:landflight/vues/home/home_screen.dart';
import 'package:landflight/vues/onboarding/choix_langue.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'controller/ControllerComment.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Scaffold(
                    body: HomeScreen(),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else
                  return ChoixLangue();
              })),
    );
  }
}
