import 'package:flutter/material.dart';
import '../presentation/general/scroll_view/scroll_view.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  final List<Widget> items;
  TopRatedMoviesWidget(this.items);

  @override
  Widget build(BuildContext context) {
    return ScrolViewWidget(items);
  }
}
