import 'package:flutter/material.dart';

class ScrolViewWidget extends StatelessWidget {
  final List<Widget> items;
  ScrolViewWidget(this.items);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(4),
          sliver: SliverGrid.count(
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
            childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
            children: items,
          ),
        ),
      ],
    );
  }
}
