import "package:flutter/material.dart";
//import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //tela para construir algo
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 226, 225, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 128,
            bottom: 30,
            left: 16,
            right: 16,
          ),
          child: Center(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                //SvgPicture.asset('images/logo_svg.svg'),
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/logo.png',
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Color.fromRGBO(126, 87, 194, 1),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 12,
                      bottom: 12,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'E-Mail',
                            labelStyle: TextStyle(
                              fontSize: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromRGBO(48, 62, 159, 1),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Senha',
                            labelStyle: TextStyle(
                              fontSize: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromRGBO(48, 62, 159, 1),
                              ),
                            ),
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
                              child: const Text('Registrar'),
                            ),
                          ],
                        ),
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
