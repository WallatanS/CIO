import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (_, i) {
          if (i < 2) {
            return _buildContainer(color: Colors.deepOrange.shade400);
          } else if (i == 2) {
            return _horizontal();
          } else {
            return _buildContainer(color: Colors.blueAccent.shade200);
          }
        },
      ),
    );
  }

  Widget _horizontal() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => _buildContainer(
          color: Colors.lime.shade500,
        ),
      ),
    );
  }

  Widget _buildContainer({Color? color}) => Container(
        margin: const EdgeInsets.all(12),
        height: 100,
        width: 200,
        color: color,
        child: Center(
          child: Text(
            color.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
}
