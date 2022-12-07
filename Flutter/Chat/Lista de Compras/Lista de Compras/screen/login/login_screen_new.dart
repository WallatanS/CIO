import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:listcom/commons/color_schemes.g2.dart';
import 'package:listcom/models/user/user.dart';
import 'package:listcom/models/user/user_services.dart';
import 'package:listcom/main_page_screen.dart';
import 'package:listcom/screen/login/sign_up_screen.dart';
import 'package:listcom/services/dialogs.dart';
import 'package:listcom/utils/authenticator.dart';
import 'package:path/path.dart';

class LoginScreenNew extends StatefulWidget {
  LoginScreenNew({Key? key}) : super(key: key);

  @override
  State<LoginScreenNew> createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  final UserLocal _userLocal = UserLocal();

  final UserServices _userServices = UserServices();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: ThemeData.dark(true),
        // appBar: PreferredSize(
        //   preferredSize: Size(screenSize.width, 1000),
        //   child: Container(
        //     color: Colors.blue,
        //     child: Padding(
        //       padding: const EdgeInsets.all(20),
        //       child: Row(
        //         children: [
        //           const Text('EXPLORE'),
        //           Expanded(
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 InkWell(
        //                   onTap: () {},
        //                   child: const Text(
        //                     'Discover',
        //                     style: TextStyle(color: Colors.black),
        //                   ),
        //                 ),
        //                 SizedBox(width: screenSize.width / 20),
        //                 InkWell(
        //                   onTap: () {},
        //                   child: const Text(
        //                     'Contact Us',
        //                     style: TextStyle(color: Colors.black),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           InkWell(
        //             onTap: () {},
        //             child: const Text(
        //               'Sign Up',
        //               style: TextStyle(color: Colors.black),
        //             ),
        //           ),
        //           SizedBox(
        //             width: screenSize.width / 50,
        //           ),
        //           InkWell(
        //             onTap: () {},
        //             child: const Text(
        //               'Login',
        //               style: TextStyle(color: Colors.black),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return const MainPageScreen();
            } else {
              return loginPage(context);
            }
          },
        ),
      ),
    );
  }

  Widget loginPage(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          Flexible(
            flex: 1,
            child: Image.asset(
              'assets/compras/compras2.jpeg',
              height: 160,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 350,
            height: 58,
            margin: const EdgeInsets.all(16),
            // decoration: BoxDecoration(
            //   color: Colors.grey[300],
            //   borderRadius: const BorderRadius.only(
            //     topLeft: Radius.circular(10),
            //     bottomRight: Radius.circular(10),
            //   ),
            //   border: Border.all(
            //     color: Colors.blue,
            //     width: 2,
            //   ),
            // ),
            child: const Text(
              "App - ListShop",
              style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.blue,
                    offset: Offset(5.0, 5.0),
                  ),
                  Shadow(
                    color: Colors.green,
                    blurRadius: 10.0,
                    offset: Offset(-10.0, 5.0),
                  ),
                ],
                fontSize: 35,
                color: Color.fromARGB(255, 47, 14, 2),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              margin: const EdgeInsets.only(left: 50, right: 50),
              color: Colors.brown.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Informe a E-mail',
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.email_outlined),
                      ),
                    ),
                    enabled: true,
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Campo deve ser preenchido!!!';
                      }
                      return null;
                    },
                    onSaved: (email) => _userLocal.email = email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Informe a senha',
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.email_outlined),
                      ),
                    ),
                    enabled: true,
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Campo deve ser preenchido!!!';
                      }
                      return null;
                    },
                    onSaved: (password) => _userLocal.password = password,
                  ),
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      bool ok = await _userServices.signIn(_userLocal);
                      if (ok) {
                        if (mounted) {
                          //mounted só funciona em stf
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const MainPageScreen(),
                            ),
                          );
                        }
                      } else {
                        Dialogs.errorDialog(
                            subtitle: "A senha informada não confere",
                            context: context);
                      }
                    }
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Registrar-se',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
