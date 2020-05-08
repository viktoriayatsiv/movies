import 'package:flutter/material.dart';
import 'package:movies/di/injector.dart';
import 'package:movies/domain/models/movie/movie.dart';
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

  List<CardItem> dataToWidget(List<Movie> movies) {
    return movies
        .where((movie) => movie.title != null)
        .map<CardItem>((movie) => new CardItem(Colors.teal, text: movie.title))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Injector.of(context).main().getBloc();
    return StreamBuilder(
        stream: bloc.moviesStream(),
        initialData: 0,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              // return PageView.builder(
              //     // Changes begin here
              //     controller: _controller,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: snapshot.data.length,
              //     itemBuilder: (context, position) {
              //       final moviesWidget = dataToWidget(snapshot.data);
              //       return PopularMoviesWidget(moviesWidget);
              //     });
              final moviesWidget = dataToWidget(snapshot.data);
              return PageView(
                controller: _controller,
                children: [
                  PopularMoviesWidget(moviesWidget),
                  // TopRatedMoviesWidget([]),
                ],
              );
          }
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
