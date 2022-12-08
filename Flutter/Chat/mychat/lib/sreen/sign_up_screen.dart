import "package:flutter/material.dart";
import 'package:mychat/commons/textFormItem.dart';
import 'package:mychat/model/users/user.dart';
import 'package:mychat/model/users/user_services.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final UserLocal userLocal = UserLocal();
  final UserServices userServices = UserServices();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 24),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  color: const Color.fromRGBO(245, 245, 246, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      //Para banco----
                      TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          //labelText: ,
                          hintText: 'Nome Completo',
                          labelText: 'Nome Completo',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(48, 62, 159, 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(48, 62, 159, 1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(48, 62, 159, 1),
                            ),
                          ),
                        ),
                        enabled: true,
                        validator: (name) {
                          if (name!.isEmpty) {
                            return 'Campo deve ser preenchido!!!';
                          } else if (name.trim().split('').length <= 1) {
                            return 'Prencha com seu nome completo';
                          }
                          return null;
                        },
                        onSaved: (name) => userLocal.name = name,
                      ),
                      //email
                      const SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(48, 62, 159, 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(48, 62, 159, 1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(48, 62, 159, 1),
                            ),
                          ),
                        ),
                        enabled: true,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Campo deve ser preenchido!!!';
                          }
                          return null;
                        },
                        onSaved: (email) => userLocal.email = email,
                      ),
                      //rede social
                      const SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Rede Social',
                          labelText: 'Rede Social',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(48, 62, 159, 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(48, 62, 159, 1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(48, 62, 159, 1),
                            ),
                          ),
                        ),
                        enabled: true,
                        validator: (socialMidia) {
                          if (socialMidia!.isEmpty) {
                            return 'Campo deve ser preenchido!!!';
                          }
                          return null;
                        },
                        onSaved: (socialMidia) =>
                            userLocal.socialMedia = socialMidia,
                      ),
                      //senha
                      const SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        decoration: InputDecoration(
                          //labelText: ,
                          hintText: 'Senha',
                          labelText: 'Senha',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(48, 62, 159, 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromRGBO(48, 62, 159, 1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(48, 62, 159, 1),
                            ),
                          ),
                        ),
                        enabled: true,
                        validator: (password) {
                          if (password!.isEmpty) {
                            return 'Campo deve ser preenchido!!!';
                          }
                          return null;
                        },
                        onSaved: (password) => userLocal.password = password,
                      ),
                      const SizedBox(height: 24),
                      //Para banco----
                      //const SizedBox(height: 24),
                      //textFormItem(context, "Nome Completo", false),
                      //const SizedBox(height: 24),
                      //textFormItem(context, "Email", false),
                      //const SizedBox(height: 24),
                      //textFormItemsenha(context, "Senha", true),
                      //const SizedBox(height: 24),
                      //textFormItem(context, "Rede Social", false),
                      //const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); //comando para sair da tela
                            },
                            child: const Text("Cancelar"),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                //if(UserLocal.passwor != userLocal.confirmpPassword)
                                //executar ScaffolMessenger
                                userServices.signUp(userLocal);
                                Navigator.of(context).pop();
                              }
                            },
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
    );
  }
}
