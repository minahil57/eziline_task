// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
//  import 'firebase_options.dart';
//  await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
/// // ...
//  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaSZ22glhfAdpfvn60OLlQyVb2XZItWfk',
    appId: '1:78327129885:android:cea547688ce39a0fea63f4',
    messagingSenderId: '78327129885',
    projectId: 'eziline-task-management-79d29',
    storageBucket: 'eziline-task-management-79d29.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJSfjDMAzcVN4lFnRWY006J2CLxXZlfb8',
    appId: '1:78327129885:ios:98828917ea0d12fdea63f4',
    messagingSenderId: '78327129885',
    projectId: 'eziline-task-management-79d29',
    storageBucket: 'eziline-task-management-79d29.appspot.com',
    iosBundleId: 'com.example.ezilineTask',
  );
}
