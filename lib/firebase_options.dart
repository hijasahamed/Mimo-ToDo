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
    apiKey: 'AIzaSyAk5WiiFRVndYMHxX2kf2oqBn-R00lRrK4',
    appId: '1:1078077012556:web:c8b6f10c054042f13592e9',
    messagingSenderId: '1078077012556',
    projectId: 'mimo-8b1e1',
    authDomain: 'mimo-8b1e1.firebaseapp.com',
    storageBucket: 'mimo-8b1e1.firebasestorage.app',
    measurementId: 'G-BYTJ26FHCF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAM5O3P5om-dzsZHWzqpcYdTg4tKovzp0A',
    appId: '1:1078077012556:android:d7d20b70fe0734063592e9',
    messagingSenderId: '1078077012556',
    projectId: 'mimo-8b1e1',
    storageBucket: 'mimo-8b1e1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnY3FbsQanahylastVLhwwkuy86iNewfM',
    appId: '1:1078077012556:ios:e7c43ebe1c98d77c3592e9',
    messagingSenderId: '1078077012556',
    projectId: 'mimo-8b1e1',
    storageBucket: 'mimo-8b1e1.firebasestorage.app',
    iosBundleId: 'com.example.mimoFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnY3FbsQanahylastVLhwwkuy86iNewfM',
    appId: '1:1078077012556:ios:e7c43ebe1c98d77c3592e9',
    messagingSenderId: '1078077012556',
    projectId: 'mimo-8b1e1',
    storageBucket: 'mimo-8b1e1.firebasestorage.app',
    iosBundleId: 'com.example.mimoFlutterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAk5WiiFRVndYMHxX2kf2oqBn-R00lRrK4',
    appId: '1:1078077012556:web:4c8875f8f8bf7fae3592e9',
    messagingSenderId: '1078077012556',
    projectId: 'mimo-8b1e1',
    authDomain: 'mimo-8b1e1.firebaseapp.com',
    storageBucket: 'mimo-8b1e1.firebasestorage.app',
    measurementId: 'G-MHQ7KDVB0H',
  );
}
