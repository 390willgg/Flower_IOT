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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDfpSHv6jlxCGB0ux4OFCjQ_fI_mVQIyVg',
    appId: '1:522244921049:web:8b063fbf1f36f23d8c50c8',
    messagingSenderId: '522244921049',
    projectId: 'kelembaban-tanah-72e35',
    authDomain: 'kelembaban-tanah-72e35.firebaseapp.com',
    databaseURL: 'https://kelembaban-tanah-72e35-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kelembaban-tanah-72e35.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9eHu2i9R-47cGkOQ4Rv3O6DoO1ekEW00',
    appId: '1:522244921049:android:9b489a346fc374258c50c8',
    messagingSenderId: '522244921049',
    projectId: 'kelembaban-tanah-72e35',
    databaseURL: 'https://kelembaban-tanah-72e35-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kelembaban-tanah-72e35.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCK64e-F8dcDHju1XMVKxm_rzi-zcOGpIQ',
    appId: '1:522244921049:ios:2a11c22c1c0091a58c50c8',
    messagingSenderId: '522244921049',
    projectId: 'kelembaban-tanah-72e35',
    databaseURL: 'https://kelembaban-tanah-72e35-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kelembaban-tanah-72e35.firebasestorage.app',
    iosBundleId: 'com.example.flowerProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDfpSHv6jlxCGB0ux4OFCjQ_fI_mVQIyVg',
    appId: '1:522244921049:web:96f58eae0be4d6d58c50c8',
    messagingSenderId: '522244921049',
    projectId: 'kelembaban-tanah-72e35',
    authDomain: 'kelembaban-tanah-72e35.firebaseapp.com',
    databaseURL: 'https://kelembaban-tanah-72e35-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'kelembaban-tanah-72e35.firebasestorage.app',
  );
}