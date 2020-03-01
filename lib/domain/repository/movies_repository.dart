import 'package:movies/data/source/remote_movies_source.dart';
import 'package:movies/domain/model/movie.dart';

class MoviesRepository {

  final RemoteMoviesSource _remoteMoviesSource;

  MoviesRepository(this._remoteMoviesSource);

  Future<List<Movie>> getMovies() async {
    return _remoteMoviesSource.fetchMovies();
  }
}