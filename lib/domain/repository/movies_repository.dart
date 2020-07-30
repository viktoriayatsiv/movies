import 'package:movies/data/source/remote_movies_source.dart';
import 'package:movies/domain/models/configuration/configuration.dart';
import 'package:movies/domain/models/genre/genre.dart';
import 'package:movies/domain/models/genres/genres.dart';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/domain/models/movies_page/movies_page.dart';

class MoviesRepository {
  final RemoteMoviesSource _remoteMoviesSource;
  final String remoteMoviesSourceApiKey = '217a2cedaff0acb1d6b84e1d02d07ff8';

  MoviesRepository(this._remoteMoviesSource);

  Future<MoviesPage> fetchMoviesPage() async {
    return _remoteMoviesSource.fetchMoviesPage(remoteMoviesSourceApiKey);
  }

  Future<Configuration> getConfiguration() async {
    return _remoteMoviesSource.getConfiguration(remoteMoviesSourceApiKey);
  }

  Future<Genres> getGenres() async {
    return _remoteMoviesSource.getGenres(remoteMoviesSourceApiKey);
  }

  Future<List<Movie>> getMovies() async {
    List<Movie> results = [];
    final MoviesPage moviesPage = await this.fetchMoviesPage();
    final Configuration configuration = await this.getConfiguration();
    final Genres genres = await this.getGenres();
    results =
        this.parseAdditionalInfo(moviesPage.results, configuration, genres);

    return results;
  }

  List<Movie> parseAdditionalInfo(
      List<Movie> movies, Configuration configuration, Genres genres) {
    return movies.map<Movie>((movie) {
      movie.posterPath =
          configuration.images.baseUrl + '/w500' + movie.posterPath;
      movie.backdropPath = configuration.images.baseUrl + movie.backdropPath;
      movie.genreList = this.genreIDsToList(movie.genreIds, genres.genres);
      return movie;
    }).toList();
  }

  List<String> genreIDsToList(List<int> genreIds, List<Genre> allGenres) {
    return genreIds
        .map<String>((genreId) => this.findGenreById(genreId, allGenres))
        .toList();
  }

  String findGenreById(int id, List<Genre> allGenres) {
    final indexOfList = allGenres.indexWhere((genre) => genre.id == id);

    return indexOfList != -1 ? allGenres[indexOfList].name : null;
  }
}
