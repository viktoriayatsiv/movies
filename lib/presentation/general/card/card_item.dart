import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Color color;
  final String text;
  CardItem(this.color, {this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
            splashColor: Colors.teal,
            highlightColor: Colors.transparent,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 150,
                  child: Stack(
                    children: [
                      Positioned.fill(child: Ink.image(image: AssetImage('assets/food.jpeg'))),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: 0,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Image text ',
                            style: TextStyle(
                              color: Colors.yellow,
                              backgroundColor: Colors.teal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (text == null) ? 'Test text' : text,
                        style: TextStyle(
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    RaisedButton(
                      child: Text('button'),
                      textColor: Colors.amber,
                      onPressed: () {
                        print('pressed');
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
