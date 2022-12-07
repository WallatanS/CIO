import "package:flutter/material.dart";
import 'package:mychat/commons/textFormItem.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(225, 226, 225, 1),
          child: Center(
            child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: const Color.fromRGBO(245, 245, 246, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        const SizedBox(height: 24),
                        textFormItem(context, "Nome", false),
                        const SizedBox(height: 24),
                        textFormItem(context, "Email", false),
                        const SizedBox(height: 24),
                        textFormItemsenha(context, "Senha", true),
                        const SizedBox(height: 24),
                        textFormItem(context, "Rede Social", false),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text("Cancelar"),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text("Salvar"),
                            ),
                          ],
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
