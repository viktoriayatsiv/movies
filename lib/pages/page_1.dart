import 'package:flutter/material.dart';
import '../general/card_item.dart';

class PageWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [CardItem(Colors.teal, text: 'Changed teal',),],
        ),
      ],
    );
  }
}
