import 'package:flutter/material.dart';

Widget textFormItem(BuildContext context, String name, bool obscure) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .85,
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: obscure,
      
      decoration: InputDecoration(
        hintText: name,
        labelStyle: const TextStyle(
          fontSize: 12,
          color: Colors.green,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.teal,
          ),
        ),
      ),
    ),
  );
}
