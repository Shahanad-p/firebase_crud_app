// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crud_app/service/firebase_options.dart';

// import 'package:firebase_crud_app/view/home_screen.dart';

// import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
import 'package:firebase_crud_app/controller/base_provider.dart';
import 'package:firebase_crud_app/controller/student_provider.dart';
import 'package:firebase_crud_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDDZzklQ35Htq_g57jc2jSyv9VfgTCVI-s",
        appId: "1:718227030644:android:125072113803eaefaf8721",
        messagingSenderId: "718227030644",
        projectId: "student-b7ef3",
        storageBucket: "student-b7ef3.appspot.com"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BaseProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
