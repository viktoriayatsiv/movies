import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';

class DrawerWidget extends StatelessWidget {
  final List<String> items;
  final PageController controller;

  DrawerWidget(this.items, this.controller);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 70.0,
            child: DrawerHeader(
                child: Text(
                  "Genres",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(moviesDefaultPadding)),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              String item = items[index];
              return ListTile(
                leading: Icon(
                  Icons.movie_filter,
                  color: Colors.yellow.shade100,
                ),
                title: Text(
                  item,
                  style: TextStyle(color: Colors.yellow.shade200, fontSize: 16),
                ),
                onTap: () {
                  controller.jumpToPage(index);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
