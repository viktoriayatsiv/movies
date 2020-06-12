import 'package:movies/domain/models/configuration/configuration.dart';
import 'package:movies/domain/models/movies_page/movies_page.dart';
import 'dart:async';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'remote_movies_source.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class RemoteMoviesSource {
  factory RemoteMoviesSource(Dio dio, {String baseUrl}) = _RemoteMoviesSource;

  @GET('/trending/all/day')
  Future<MoviesPage> fetchMoviesPage(
    @Query("api_key") String apiKey,
  );

  @GET('/configuration')
  Future<Configuration> getConfiguration(
    @Query("api_key") String apiKey,
  );
}
