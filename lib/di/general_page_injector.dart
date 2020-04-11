
import 'package:movies/data/source/remote_movies_source.dart';
import 'package:movies/domain/repository/movies_repository.dart';
import 'package:movies/presentation/general/general_bloc.dart';
import 'package:dio/dio.dart';

class GeneralPageInjector {

  RemoteMoviesSource _remoteMoviesSource;
  MoviesRepository _moviesRepository;

  GeneralPageBloc _generalPageBloc;

  void init() {
    _remoteMoviesSource = RemoteMoviesSource(Dio());
    _moviesRepository = MoviesRepository(_remoteMoviesSource);
  }

  GeneralPageBloc getBloc() {
    if (_generalPageBloc == null) {
      _generalPageBloc = GeneralPageBloc(_moviesRepository);
      return _generalPageBloc;
    }
    return _generalPageBloc;
  }
}