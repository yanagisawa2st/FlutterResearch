import 'package:flutter/material.dart';
import 'gps.dart';
import 'home_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{ 
  //firebaseを使う際の初期化処理
  //インポートした３行目のfirebase_coreを処理して利用
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //インポートした５行目のfirebase_optionsを利用
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.blue
      ),
      home:HomeMenu(),
      
    );
  }
}


