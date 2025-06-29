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
    apiKey: 'AIzaSyCM7mr2IBZfNv16B2HB1S5MU8JznecyMds',
    appId: '1:944601727755:web:d7010aaa72d9b3c123580e',
    messagingSenderId: '944601727755',
    projectId: 'labtest-73324',
    authDomain: 'labtest-73324.firebaseapp.com',
    storageBucket: 'labtest-73324.firebasestorage.app',
    measurementId: 'G-EJP4LQKZ8R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCR2C-Ma3ItgB05qEMhxYxiQyfCs2Sf9lY',
    appId: '1:944601727755:android:b55256e7eefdd6b123580e',
    messagingSenderId: '944601727755',
    projectId: 'labtest-73324',
    storageBucket: 'labtest-73324.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOCASkGlsgKEiK6GQlLj-KJD8AuHiQFBU',
    appId: '1:944601727755:ios:3be9543b22d39aa823580e',
    messagingSenderId: '944601727755',
    projectId: 'labtest-73324',
    storageBucket: 'labtest-73324.firebasestorage.app',
    iosBundleId: 'com.example.staffCrudApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOCASkGlsgKEiK6GQlLj-KJD8AuHiQFBU',
    appId: '1:944601727755:ios:3be9543b22d39aa823580e',
    messagingSenderId: '944601727755',
    projectId: 'labtest-73324',
    storageBucket: 'labtest-73324.firebasestorage.app',
    iosBundleId: 'com.example.staffCrudApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCM7mr2IBZfNv16B2HB1S5MU8JznecyMds',
    appId: '1:944601727755:web:3547d2d588f0580023580e',
    messagingSenderId: '944601727755',
    projectId: 'labtest-73324',
    authDomain: 'labtest-73324.firebaseapp.com',
    storageBucket: 'labtest-73324.firebasestorage.app',
    measurementId: 'G-WEX29MN61L',
  );
}
