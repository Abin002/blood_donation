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
    apiKey: 'AIzaSyCkCgYF0bjuHH2pfm_xaUWrGIX25AlFaBc',
    appId: '1:908179505196:web:753e5d199aeae23eea9189',
    messagingSenderId: '908179505196',
    projectId: 'bloodbank-5f5f5',
    authDomain: 'bloodbank-5f5f5.firebaseapp.com',
    storageBucket: 'bloodbank-5f5f5.appspot.com',
    measurementId: 'G-Y5YS9ZV1EW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqgxI4UeiLT-xLMRWOz99GbrZUsKj0xzU',
    appId: '1:908179505196:android:017f8adda597c4e7ea9189',
    messagingSenderId: '908179505196',
    projectId: 'bloodbank-5f5f5',
    storageBucket: 'bloodbank-5f5f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlt73IRWA8XVrB4X_FV0nz7pWQRxo1FW4',
    appId: '1:908179505196:ios:fbe81821c3edc33aea9189',
    messagingSenderId: '908179505196',
    projectId: 'bloodbank-5f5f5',
    storageBucket: 'bloodbank-5f5f5.appspot.com',
    iosClientId:
        '908179505196-f6nimmie7hdo81qh1pr3p42ervjvdek4.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodDonation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlt73IRWA8XVrB4X_FV0nz7pWQRxo1FW4',
    appId: '1:908179505196:ios:f68ec953ad75c159ea9189',
    messagingSenderId: '908179505196',
    projectId: 'bloodbank-5f5f5',
    storageBucket: 'bloodbank-5f5f5.appspot.com',
    iosClientId:
        '908179505196-b8v7bbp0cpkeit3k5srr5re39fq3odlv.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloodDonation.RunnerTests',
  );
}