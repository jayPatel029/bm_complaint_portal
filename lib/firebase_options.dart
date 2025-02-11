// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyD8r4M6FCOP8owZrqaS5nzj6UVh54g8RCg',
    appId: '1:101974869089:web:05f47a0e38ce47321a1620',
    messagingSenderId: '101974869089',
    projectId: 'bm-complaint-app',
    authDomain: 'bm-complaint-app.firebaseapp.com',
    storageBucket: 'bm-complaint-app.appspot.com',
    measurementId: 'G-WJX7F00Y1V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7oJJVwZ4H3PoCXDfqfbFWH46j9fpKQdE',
    appId: '1:101974869089:android:3fab5e3cdd3c9d801a1620',
    messagingSenderId: '101974869089',
    projectId: 'bm-complaint-app',
    storageBucket: 'bm-complaint-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKyDmmM8gdq2V-nfYIVWdiBZe-hUV1S7c',
    appId: '1:101974869089:ios:543219833d23efdd1a1620',
    messagingSenderId: '101974869089',
    projectId: 'bm-complaint-app',
    storageBucket: 'bm-complaint-app.appspot.com',
    iosBundleId: 'com.example.bmComplaintPortalApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKyDmmM8gdq2V-nfYIVWdiBZe-hUV1S7c',
    appId: '1:101974869089:ios:543219833d23efdd1a1620',
    messagingSenderId: '101974869089',
    projectId: 'bm-complaint-app',
    storageBucket: 'bm-complaint-app.appspot.com',
    iosBundleId: 'com.example.bmComplaintPortalApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD8r4M6FCOP8owZrqaS5nzj6UVh54g8RCg',
    appId: '1:101974869089:web:4b558aba4738212f1a1620',
    messagingSenderId: '101974869089',
    projectId: 'bm-complaint-app',
    authDomain: 'bm-complaint-app.firebaseapp.com',
    storageBucket: 'bm-complaint-app.appspot.com',
    measurementId: 'G-H720216QXP',
  );
}
