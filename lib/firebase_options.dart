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
    apiKey: 'AIzaSyC66uw3IuOclgbXYJsKMTJG2Jr6idgxcMk',
    appId: '1:487086023985:web:361c58067d22c67f2c7c10',
    messagingSenderId: '487086023985',
    projectId: 'sahithyolsavapp',
    authDomain: 'sahithyolsavapp.firebaseapp.com',
    storageBucket: 'sahithyolsavapp.appspot.com',
    measurementId: 'G-LJ5D2D74Q7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrHpbTWs46oxYLefKoOTtQLa-xSt42YuI',
    appId: '1:487086023985:android:1978cb7c5569be8d2c7c10',
    messagingSenderId: '487086023985',
    projectId: 'sahithyolsavapp',
    storageBucket: 'sahithyolsavapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAR2gu2l4WMfqd90xQK2AQ3-GaOgVy2NQE',
    appId: '1:487086023985:ios:ee9fcba6891ece192c7c10',
    messagingSenderId: '487086023985',
    projectId: 'sahithyolsavapp',
    storageBucket: 'sahithyolsavapp.appspot.com',
    iosClientId: '487086023985-769uo1ib94tf9n0skvdp6v799llpef5n.apps.googleusercontent.com',
    iosBundleId: 'com.example.sahithyolsavApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAR2gu2l4WMfqd90xQK2AQ3-GaOgVy2NQE',
    appId: '1:487086023985:ios:ee9fcba6891ece192c7c10',
    messagingSenderId: '487086023985',
    projectId: 'sahithyolsavapp',
    storageBucket: 'sahithyolsavapp.appspot.com',
    iosClientId: '487086023985-769uo1ib94tf9n0skvdp6v799llpef5n.apps.googleusercontent.com',
    iosBundleId: 'com.example.sahithyolsavApp',
  );
}
