import 'package:flutter/material.dart';
import 'package:mychat/commons/textFormItem.dart';
import 'package:mychat/sreen/sign_up_screen.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:petitparser/matcher.dart';

class LoginScreenNew extends StatelessWidget {
  const LoginScreenNew({super.key});

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            //mainAxisSize: MainAxisSize.min,
            children: [
              //SvgPicture.asset('images/logo_svg.svg'),
              const SizedBox(height: 64),
              Image.asset('images/logo.png', height: 100),
              const SizedBox(height: 36),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: const Color.fromRGBO(245, 245, 246, 1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.black12,
                        //alignment: Alignment.topLeft,
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Color.fromRGBO(126, 87, 194, 1),
                              fontSize: 32,
                              //fontStyle: FontStyle.italic,
                              //backgroundColor: Color.fromRGBO(215, 210, 210, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 24),
                      textFormItem(context, 'E-mail', false),
                      const SizedBox(height: 16),
                      textFormItemsenha(context, 'Senha', true),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 148,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Entrar'),
                            ),
                          ),
                          SizedBox(
                            width: 148,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              child: const Text('Cadastrar'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
