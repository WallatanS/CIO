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
        primarySwatch: Colors.indigo,
        secondaryHeaderColor: Colors.blueGrey,
      ),
      home: const LoginScreenNew(),
    );
  }
}
