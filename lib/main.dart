import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:landflight/controller/MenuController.dart';
import 'package:landflight/controller/SearchController.dart';
import 'package:landflight/vues/authentification/login.dart';
import 'package:landflight/vues/home/home_screen.dart';
import 'package:landflight/vues/onboarding/choix_langue.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'controller/ControllerComment.dart';
import 'controller/LikePostController.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runZonedGuarded(
      () => runApp(
            const MyApp(),
          ), (error, stack) {
    if (error is TypeError || error is SocketException) {
      print("No network connection");
      // Show error message to user
      // Example:
      SmartDialog.showNotify(
        msg: "Aucune connection internet! Vérifiez votre connection internet.",
        notifyType: NotifyType.error,
        useAnimation: true,
      );
    }
  });
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
        ChangeNotifierProvider(create: (_) {
          return LikePostController();
        }),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [FlutterSmartDialog.observer],
          // here
          builder: FlutterSmartDialog.init(),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //SmartDialog.dismiss();
                  return Scaffold(
                    body: HomeScreen(),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  // SmartDialog.dismiss();
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  //    SmartDialog.dismiss();
                  return Login(); //ChoixLangue();
                }
              })),
    );
  }
}
