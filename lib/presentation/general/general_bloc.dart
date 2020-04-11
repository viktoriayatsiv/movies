
import 'dart:async';
import 'package:movies/domain/models/movie/movie.dart';
import 'package:movies/domain/repository/movies_repository.dart';
import 'package:movies/presentation/bloc.dart';

class GeneralPageBloc implements BaseBloc {

  final MoviesRepository _moviesRepository;

  final moviesStreamController = StreamController<List<Movie>>();
  StreamSink<List<Movie>> moviesSink() => moviesStreamController.sink;
  Stream<List<Movie>> moviesStream() => moviesStreamController.stream;

  GeneralPageBloc(this._moviesRepository) {
    _loadMovies();
  }

  _loadMovies() {
    print("MainBloc: start fetching movies");
    _moviesRepository.getMovies().asStream().listen((event) {
      moviesSink().add(event);
    });
  }

  @override
  void dispose() {
    moviesStreamController.close();
  }
}