// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAFHZ9aJgUQfLM8tLQXZluBxim44p7HBU0',
    appId: '1:1025923569206:web:14ab9eb0aa6fa050a6aa97',
    messagingSenderId: '1025923569206',
    projectId: 'landflight-backend',
    authDomain: 'landflight-backend.firebaseapp.com',
    databaseURL: 'https://landflight-backend-default-rtdb.firebaseio.com',
    storageBucket: 'landflight-backend.appspot.com',
    measurementId: 'G-7NQECZ1MS3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAplByaGz14EVdsU_qbu9zylDtpNOlMIM',
    appId: '1:1025923569206:android:2708f2ea26d05223a6aa97',
    messagingSenderId: '1025923569206',
    projectId: 'landflight-backend',
    databaseURL: 'https://landflight-backend-default-rtdb.firebaseio.com',
    storageBucket: 'landflight-backend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-04Sp18ybMhFhRUaGvyp8wC3jNsqGMEM',
    appId: '1:1025923569206:ios:c1bccdd28014170aa6aa97',
    messagingSenderId: '1025923569206',
    projectId: 'landflight-backend',
    databaseURL: 'https://landflight-backend-default-rtdb.firebaseio.com',
    storageBucket: 'landflight-backend.appspot.com',
    iosClientId: '1025923569206-6m26973r2e8l8j4jcle74cjkjsacndi8.apps.googleusercontent.com',
    iosBundleId: 'com.example.landflight',
  );
}
