import 'package:flutter/material.dart';

class AppBarMobile extends StatelessWidget {
  AppBarMobile({super.key, this.title});
  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 199, 211, 216),
      leading: IconButton(
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Text(
        title!,
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          tooltip: 'Favorito',
          icon: const Icon(
            Icons.favorite,
          ),
          onPressed: () {},
        ),
        IconButton(
          tooltip: 'Buscar',
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {},
        ),
        PopupMenuButton<Text>(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Primeiro'),
              ),
              const PopupMenuItem(
                child: Text('Segundo'),
              ),
              const PopupMenuItem(
                child: Text('Terceiro'),
              ),
            ];
          },
        )
      ],
    );
  }
}
