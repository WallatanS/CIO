import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hellow Word"),
      ),
      body: Center(
        child: OutlinedButton(
            onPressed: () {}, child: const Text("Aperte Meu Botão, yaaaa!")),
      ),
    );
  }
}
