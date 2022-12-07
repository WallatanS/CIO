import 'package:flutter/material.dart';
import 'package:mychat/commons/login_screen.dart';
import 'package:mychat/sreen/login_screen_new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Versão 1.0',
      theme: ThemeData(
        primaryColor: const Color(0x00512da8),
        scaffoldBackgroundColor: Colors.grey[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreenNew(),
    );
  }
}
