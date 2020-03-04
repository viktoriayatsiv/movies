import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'More',
          onPressed: () {},
        ),
      ],
      title: const Text('AppBar'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
