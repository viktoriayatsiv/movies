import 'package:flutter/material.dart';
import '../general/card_item.dart';

class PageWidget0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            CardItem(Colors.deepOrange),
            CardItem(Colors.green, text: 'Changed green'),
          ],
        ),
      ],
    );
  }
}
