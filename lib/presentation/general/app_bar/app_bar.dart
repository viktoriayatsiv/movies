import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: const Text('Movies'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
