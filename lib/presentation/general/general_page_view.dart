import 'package:flutter/material.dart';
import 'package:movies/di/injector.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/presentation/general/loader/loader.dart';
import 'package:movies/presentation/general/movie_card/movie_card.dart';
import '../../screens/popular_movies.dart';
import '../../screens/top_rated_movies.dart';

class GeneralPageView extends StatefulWidget {
  @override
  _GeneralPageViewState createState() => _GeneralPageViewState();
}

class _GeneralPageViewState extends State<GeneralPageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  List<MovieCard> dataToWidget(List<Movie> movies) {
    return movies
        .where((movie) => movie.title != null)
        .map<MovieCard>((movie) => new MovieCard(movie))
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
            case ConnectionState.none:
              return new Text('None');
            case ConnectionState.waiting:
              return new Loader();
            default:
              final moviesWidget = dataToWidget(snapshot.data);
              return PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  PopularMoviesWidget(moviesWidget),
                  TopRatedMoviesWidget([]),
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
