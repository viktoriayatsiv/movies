import 'package:flutter/material.dart';
import 'package:movies/di/injector.dart';
import '../../screens/popular_movies.dart';
import '../../screens/top_rated_movies.dart';
import '../general/card/card_item.dart';

class GeneralPageView extends StatefulWidget {
  @override
  _GeneralPageViewState createState() => _GeneralPageViewState();
}

class _GeneralPageViewState extends State<GeneralPageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  final List<Widget> testData1 = [
    CardItem(Colors.teal, text: 'Changed teal'),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Heed not the rabble'),
      color: Colors.green[200],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var bloc = Injector.of(context).main().getBloc();
    return PageView(
      controller: _controller,
      children: [
        PopularMoviesWidget(testData1),
        TopRatedMoviesWidget([testData1[1], testData1[1], testData1[1]]),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
