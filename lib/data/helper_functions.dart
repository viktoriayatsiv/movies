import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/presentation/general/movie_card/movie_card.dart';
import 'package:movies/presentation/general/scroll_view/scroll_view.dart';

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
            convertToMovieCardWidget(List.from(
                movies.where((movie) => movie.genreList.contains(genreItem)))),
            genreItem,
          ))
      .toList();
}
