// // File generated by FlutterFire CLI.
// // ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;

// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for windows - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }

//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'AIzaSyBZIEhWJAI68O-vh4DZixtzkDXOArpD7vY',
//     appId: '1:175363092683:web:a74ed68351b9c85873ab4e',
//     messagingSenderId: '175363092683',
//     projectId: 'crud-app-a00e4',
//     authDomain: 'crud-app-a00e4.firebaseapp.com',
//     storageBucket: 'crud-app-a00e4.appspot.com',
//     measurementId: 'G-CEYZ56CT9Y',
//   );

//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyDhJY2mmzxfojUaShJkYj8SSYnBMfWoHs0',
//     appId: '1:175363092683:android:2246d8d978dfb7e873ab4e',
//     messagingSenderId: '175363092683',
//     projectId: 'crud-app-a00e4',
//     storageBucket: 'crud-app-a00e4.appspot.com',
//   );

//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyD1KFVWQUR6nqivAbz5HqW1gkN2qCo_8p8',
//     appId: '1:175363092683:ios:8175484fae6af0b373ab4e',
//     messagingSenderId: '175363092683',
//     projectId: 'crud-app-a00e4',
//     storageBucket: 'crud-app-a00e4.appspot.com',
//     iosBundleId: 'com.example.firebaseCrudApp',
//   );

//   static const FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'AIzaSyD1KFVWQUR6nqivAbz5HqW1gkN2qCo_8p8',
//     appId: '1:175363092683:ios:b0c14a966b791e3273ab4e',
//     messagingSenderId: '175363092683',
//     projectId: 'crud-app-a00e4',
//     storageBucket: 'crud-app-a00e4.appspot.com',
//     iosBundleId: 'com.example.firebaseCrudApp.RunnerTests',
//   );
// }



////////////////////////////


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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA9sNlQqxZIfAkmIQgoGy8FMcaS_iHPLM8',
    appId: '1:655574848146:android:26b40ac88086db293b4c4b',
    messagingSenderId: '655574848146',
    projectId: 'todoapp-e4a14',
    storageBucket: 'todoapp-e4a14.appspot.com',
  );
}
