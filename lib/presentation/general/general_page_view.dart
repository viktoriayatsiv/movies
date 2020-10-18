import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:movies/di/injector.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/presentation/general/loader/loader.dart';
import 'package:movies/presentation/general/movie_card/movie_card.dart';
import 'package:movies/presentation/general/scroll_view/scroll_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GeneralPageView extends StatefulWidget {
  @override
  _GeneralPageViewState createState() => _GeneralPageViewState();
}

class _GeneralPageViewState extends State<GeneralPageView> {
  int initialPage = 1;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 1,
      initialPage: initialPage,
    );
  }

  List<MovieCard> convertToMovieCardWidget(List<Movie> movies) {
    return movies
        .where((movie) => movie.title != null)
        .map<MovieCard>((movie) => new MovieCard(movie))
        .toList();
  }

  Set<String> getAllAvailableGanres(List<Movie> movies) {
    final List<String> results = [];
    movies
        .where((movie) => movie.genreList.length != 0)
        .forEach((movie) => results.addAll(movie.genreList));

    return results.toSet();
  }

  List<ScrolViewWidget> splitMoviesByGenre(List<Movie> movies) {
    final Set<String> genreList = getAllAvailableGanres(movies);

    return genreList
        .map<ScrolViewWidget>((genreItem) => ScrolViewWidget(
              convertToMovieCardWidget(List.from(movies
                  .where((movie) => movie.genreList.contains(genreItem)))),
              genreItem,
            ))
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
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: moviesDefaultPadding / 2,
                    ),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: splitMoviesByGenre(snapshot.data).length,
                      effect: SwapEffect(
                          dotColor: Colors.yellow.withOpacity(0.2),
                          activeDotColor: Colors.yellow),
                    ),
                  ),
                  Expanded(
                      child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        initialPage = value;
                      });
                    },
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: splitMoviesByGenre(snapshot.data),
                  ))
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
