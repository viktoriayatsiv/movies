import 'package:flutter/material.dart';
import 'package:movies/di/injector.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/presentation/general/loader/loader.dart';
import 'package:movies/presentation/general/movie_card/movie_card.dart';
import 'package:movies/presentation/general/scroll_view/scroll_view.dart';

class GeneralPageView extends StatefulWidget {
  @override
  _GeneralPageViewState createState() => _GeneralPageViewState();
}

class _GeneralPageViewState extends State<GeneralPageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  List<MovieCard> convertToMovieCardWidget(List<Movie> movies) {
    return movies
        .where((movie) => movie.title != null)
        .map<MovieCard>((movie) => new MovieCard(movie))
        .toList();
  }

  Set<int> getAllAvailableGanres(List<Movie> movies) {
    final List<int> results = [];
    movies
        .where((movie) => movie.genreIds.length != 0)
        .forEach((movie) => results.addAll(movie.genreIds));

    return results.toSet();
  }

  List<ScrolViewWidget> splitMoviesByGenre(List<Movie> movies) {
    final Set<int> genreIds = getAllAvailableGanres(movies);

    return genreIds
        .map<ScrolViewWidget>((genreId) => ScrolViewWidget(
            convertToMovieCardWidget(List.from(
                movies.where((movie) => movie.genreIds.contains(genreId))))))
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
              return PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: splitMoviesByGenre(snapshot.data),
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
