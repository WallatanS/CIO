import 'package:flutter/material.dart';

Widget colorButton(String name, BuildContext context, bool circular) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.width - 90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [
          Color(0xFFFD746C),
          Color(0xFFFF9068),
          Color(0xFFFD746C),
        ]),
      ),
      child: Center(
        child: circular
            ? const CircularProgressIndicator()
            : Text(name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
      ),
    ),
  );
}
