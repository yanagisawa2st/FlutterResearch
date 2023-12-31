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
        return macos;
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
    apiKey: 'AIzaSyCt7hgf9EHEchC9J0n9ScBAm4CzzUssklk',
    appId: '1:358500086074:web:e8c493d95edbe3b4e46003',
    messagingSenderId: '358500086074',
    projectId: 'flutter-test001-54056',
    authDomain: 'flutter-test001-54056.firebaseapp.com',
    storageBucket: 'flutter-test001-54056.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVz_ML-1a7CeS-iSogF-YgsgKwqYXzfL4',
    appId: '1:358500086074:android:e2bbacf2acd44855e46003',
    messagingSenderId: '358500086074',
    projectId: 'flutter-test001-54056',
    storageBucket: 'flutter-test001-54056.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuRIl1sXA6sTJ3EMOul97vHLjE29-YOQM',
    appId: '1:358500086074:ios:67dea1b150274fbae46003',
    messagingSenderId: '358500086074',
    projectId: 'flutter-test001-54056',
    storageBucket: 'flutter-test001-54056.appspot.com',
    androidClientId: '358500086074-8intk1akbtaua7qf76bla5u8kot4eeov.apps.googleusercontent.com',
    iosClientId: '358500086074-jon7uhbtegsl2nnephd50qkh6j7npr5e.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterReseach',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuRIl1sXA6sTJ3EMOul97vHLjE29-YOQM',
    appId: '1:358500086074:ios:2334060942deffebe46003',
    messagingSenderId: '358500086074',
    projectId: 'flutter-test001-54056',
    storageBucket: 'flutter-test001-54056.appspot.com',
    androidClientId: '358500086074-8intk1akbtaua7qf76bla5u8kot4eeov.apps.googleusercontent.com',
    iosClientId: '358500086074-sukqivc5mo83lnlvqanlqutrbp3jd6cs.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterReseach.RunnerTests',
  );
}
