import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_app/service/firebase_options.dart';

import 'package:firebase_crud_app/view/home_screen.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
