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
    apiKey: 'AIzaSyDlkouuLR-sDxOVo9M-jlHCog1mkdFrUb4',
    appId: '1:528392703629:web:e593b53e0da0fd9c5b1cc4',
    messagingSenderId: '528392703629',
    projectId: 'fooddrink-8f4f4',
    authDomain: 'fooddrink-8f4f4.firebaseapp.com',
    storageBucket: 'fooddrink-8f4f4.firebasestorage.app',
    measurementId: 'G-PQJ59DG2B6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDU1i9mk1EE2DSiB4rmxgyxWmc4gfwSqWw',
    appId: '1:528392703629:android:1a41e601c6f101145b1cc4',
    messagingSenderId: '528392703629',
    projectId: 'fooddrink-8f4f4',
    storageBucket: 'fooddrink-8f4f4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2XiZDBj1T-2JtKukRCrVKdGBf9_nfeA0',
    appId: '1:528392703629:ios:762b031e0d298d135b1cc4',
    messagingSenderId: '528392703629',
    projectId: 'fooddrink-8f4f4',
    storageBucket: 'fooddrink-8f4f4.firebasestorage.app',
    iosBundleId: 'com.example.food',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2XiZDBj1T-2JtKukRCrVKdGBf9_nfeA0',
    appId: '1:528392703629:ios:762b031e0d298d135b1cc4',
    messagingSenderId: '528392703629',
    projectId: 'fooddrink-8f4f4',
    storageBucket: 'fooddrink-8f4f4.firebasestorage.app',
    iosBundleId: 'com.example.food',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDlkouuLR-sDxOVo9M-jlHCog1mkdFrUb4',
    appId: '1:528392703629:web:c73b37832a166b245b1cc4',
    messagingSenderId: '528392703629',
    projectId: 'fooddrink-8f4f4',
    authDomain: 'fooddrink-8f4f4.firebaseapp.com',
    storageBucket: 'fooddrink-8f4f4.firebasestorage.app',
    measurementId: 'G-XBRH3644BS',
  );
}
