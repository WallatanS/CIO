// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget textFormItem(BuildContext context, String name, bool obscure) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .85,
    child: TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: name,
        labelText: name,
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
    ),
  );
}

Widget textFormItemsenha(BuildContext context, String name, bool obscure) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .85,
    child: TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: obscure,
      decoration: InputDecoration(
        //labelText: ,
        hintText: name,
        labelText: name,
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
    ),
  );
}
