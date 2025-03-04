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
    apiKey: 'AIzaSyCj2QIdgxp2ZwsTc5d4P90v0-26KPi3fQc',
    appId: '1:927536860874:web:540d38f481e56632c46e33',
    messagingSenderId: '927536860874',
    projectId: 'e-commerce-8d5d0',
    authDomain: 'e-commerce-8d5d0.firebaseapp.com',
    storageBucket: 'e-commerce-8d5d0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiiL0yy0wUbKEebKVoDPqIfnUcWeAr9zc',
    appId: '1:927536860874:android:f91965a69ac4b973c46e33',
    messagingSenderId: '927536860874',
    projectId: 'e-commerce-8d5d0',
    storageBucket: 'e-commerce-8d5d0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUWCwloVshSIUJEyZNp7H0SYnk67FOgH0',
    appId: '1:927536860874:ios:92b74872f2ebfb75c46e33',
    messagingSenderId: '927536860874',
    projectId: 'e-commerce-8d5d0',
    storageBucket: 'e-commerce-8d5d0.firebasestorage.app',
    androidClientId: '927536860874-5047pi26der5vl0rpo58b2onhnpr2urd.apps.googleusercontent.com',
    iosClientId: '927536860874-pka6c0mjav6i7f68eqa00ba83oihd8h1.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUWCwloVshSIUJEyZNp7H0SYnk67FOgH0',
    appId: '1:927536860874:ios:92b74872f2ebfb75c46e33',
    messagingSenderId: '927536860874',
    projectId: 'e-commerce-8d5d0',
    storageBucket: 'e-commerce-8d5d0.firebasestorage.app',
    androidClientId: '927536860874-5047pi26der5vl0rpo58b2onhnpr2urd.apps.googleusercontent.com',
    iosClientId: '927536860874-pka6c0mjav6i7f68eqa00ba83oihd8h1.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCj2QIdgxp2ZwsTc5d4P90v0-26KPi3fQc',
    appId: '1:927536860874:web:de09017aab170857c46e33',
    messagingSenderId: '927536860874',
    projectId: 'e-commerce-8d5d0',
    authDomain: 'e-commerce-8d5d0.firebaseapp.com',
    storageBucket: 'e-commerce-8d5d0.firebasestorage.app',
  );

}