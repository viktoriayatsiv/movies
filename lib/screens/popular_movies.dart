import 'package:flutter/material.dart';
import '../presentation/general/scroll_view/scroll_view.dart';

class PopularMoviesWidget extends StatelessWidget {
  final List<Widget> items;
  PopularMoviesWidget(this.items);

  @override
  Widget build(BuildContext context) {
    return ScrolViewWidget(items);
  }
}
