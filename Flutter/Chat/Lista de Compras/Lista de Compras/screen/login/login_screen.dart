import "package:flutter/material.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80,
            bottom: 30,
            left: 10,
            right: 10,
          ),
          child: Center(
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'assets/firebase.png',
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Lista de Aplicações",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 10,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Senha',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Entrar'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Registrar-se'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
