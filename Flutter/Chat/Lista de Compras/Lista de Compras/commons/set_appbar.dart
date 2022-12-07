import 'package:flutter/material.dart';

Widget setAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      icon: const Icon(Icons.menu),
      onPressed: () {},
    ),
    title: const Text(
      "Listcom Apps",
    ),
    actions: [
      IconButton(
        tooltip: 'Favorite',
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
