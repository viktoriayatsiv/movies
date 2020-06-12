import 'package:movies/data/source/remote_movies_source.dart';
import 'package:movies/domain/models/configuration/configuration.dart';
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

  Future<List<Movie>> getMovies() async {
    final MoviesPage moviesPage = await this.fetchMoviesPage();
    final Configuration configuration = await this.getConfiguration();
    return this.updateMoviesImage(moviesPage.results, configuration);
  }

  List<Movie> updateMoviesImage(
      List<Movie> movies, Configuration configuration) {
    return movies.map<Movie>((movie) {
      movie.posterPath = configuration.images.baseUrl + '/w500' + movie.posterPath;
      movie.backdropPath = configuration.images.baseUrl + movie.backdropPath;
      return movie;
    }).toList();
  }
}
