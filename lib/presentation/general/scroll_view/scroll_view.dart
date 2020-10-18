import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/presentation/general/details/components/genre_card.dart';

class ScrolViewWidget extends StatefulWidget {
  final List<Widget> items;
  final String genre;

  const ScrolViewWidget(this.items, this.genre);
  @override
  State<StatefulWidget> createState() => ScrolViewWidgetState();
}

class ScrolViewWidgetState extends State<ScrolViewWidget> {
  ScaffoldState scaffold;
  Size size;

  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => showSnackBar(this.widget.genre));
  }

  void showSnackBar(String text) {
    scaffold.showSnackBar(SnackBar(
        content: Text(
          text,
          style: TextStyle(color: Colors.yellow),
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.deepPurple.withOpacity(0.8),
        margin: EdgeInsets.fromLTRB(size.width / 3, size.height / 2 - 25,
            size.width / 3, size.height / 2 - 25),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(moviesDefaultPadding)))));
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    scaffold = Scaffold.of(context);
    size = MediaQuery.of(context).size;

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: moviesDefaultPadding / 2,
            horizontal: moviesDefaultPadding),
        child: GenreCard(this.widget.genre),
      ),
      Expanded(
          child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(4),
            sliver: SliverGrid.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              childAspectRatio:
                  (orientation == Orientation.portrait) ? 1.0 : 1.3,
              children: this.widget.items,
            ),
          ),
        ],
      ))
    ]);
  }
}
