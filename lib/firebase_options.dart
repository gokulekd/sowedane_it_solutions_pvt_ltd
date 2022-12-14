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
    apiKey: 'AIzaSyDx-mWAImeve45ajBKYzSZVm2eFNXCLawU',
    appId: '1:1079278974465:web:4367789cb37e1dd34db200',
    messagingSenderId: '1079278974465',
    projectId: 'sowedane-it-solutions-pvt-ltd',
    authDomain: 'sowedane-it-solutions-pvt-ltd.firebaseapp.com',
    storageBucket: 'sowedane-it-solutions-pvt-ltd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASXCuXK7S9gNwJkqbF6Fj2vUuooIKl1_E',
    appId: '1:1079278974465:android:428c4bc4d3e0bd664db200',
    messagingSenderId: '1079278974465',
    projectId: 'sowedane-it-solutions-pvt-ltd',
    storageBucket: 'sowedane-it-solutions-pvt-ltd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1_dAYpidhlECF3XR3yBnlr6pgnO8NlL0',
    appId: '1:1079278974465:ios:96f35d3f371928494db200',
    messagingSenderId: '1079278974465',
    projectId: 'sowedane-it-solutions-pvt-ltd',
    storageBucket: 'sowedane-it-solutions-pvt-ltd.appspot.com',
    iosClientId: '1079278974465-3p6318vi5qcsotnkb4664pqmmfhaev58.apps.googleusercontent.com',
    iosBundleId: 'com.example.sowedaneItSolutionsPvtLtd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1_dAYpidhlECF3XR3yBnlr6pgnO8NlL0',
    appId: '1:1079278974465:ios:96f35d3f371928494db200',
    messagingSenderId: '1079278974465',
    projectId: 'sowedane-it-solutions-pvt-ltd',
    storageBucket: 'sowedane-it-solutions-pvt-ltd.appspot.com',
    iosClientId: '1079278974465-3p6318vi5qcsotnkb4664pqmmfhaev58.apps.googleusercontent.com',
    iosBundleId: 'com.example.sowedaneItSolutionsPvtLtd',
  );
}
