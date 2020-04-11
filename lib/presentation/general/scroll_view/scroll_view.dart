import 'package:flutter/material.dart';

class ScrolViewWidget extends StatelessWidget {
  final List<Widget> items;
  ScrolViewWidget(this.items);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(5),
          sliver: SliverGrid.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            children: items,
          ),
        ),
      ],
    );
  }
}
