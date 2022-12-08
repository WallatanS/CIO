import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mychat/sreen/login_screen_new.dart';

void main() async {
  //configurar a inicialização do firebaseapp()
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAl5RuMim3GZ08PMycguhTOXPHmve03bQ4",
        authDomain: "autochat-a47a9.firebaseapp.com",
        projectId: "autochat-a47a9",
        storageBucket: "autochat-a47a9.appspot.com",
        messagingSenderId: "730957704378",
        appId: "1:730957704378:web:a48e14ac6892dd2b372683",
        measurementId: "G-QF2FF4LCGJ"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Chat',
      theme: ThemeData(
        primaryColor: const Color(0x00512da8),
        scaffoldBackgroundColor: Colors.grey[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreenNew(),
    );
  }
}
