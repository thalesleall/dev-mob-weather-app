import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions not configured for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCDqw78PYVKtb2UVrvDzjs9fQ8_69vC2fE',
    authDomain: 'weather-app-81c71.firebaseapp.com',
    projectId: 'weather-app-81c71',
    storageBucket: 'weather-app-81c71.firebasestorage.app',
    messagingSenderId: '290780740976',
    appId: '1:290780740976:web:f24b5b176b1b523c8d23b5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcCZOrI8T-bL_mzIP1Jx18cT9lbIMvo7o',
    appId: '1:290780740976:android:1efaff78d8e464d78d23b5',
    messagingSenderId: '290780740976',
    projectId: 'weather-app-81c71',
    storageBucket: 'weather-app-81c71.firebasestorage.app',
  );
}
