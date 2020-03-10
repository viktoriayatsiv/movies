import 'package:movies/domain/model/movie.dart';
import 'dart:async';
import 'dart:convert';
import './remote_api_link.dart';

import 'package:http/http.dart' as http;

class RemoteMoviesSource {
  Future<List<Movie>> fetchMovies() async {
    final response =
        await http.get(new ApiLink(link: 'trending/all/day').toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return this.parseResponseJson(response.body);
      // return new List();
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load movies');
    }
  }

  List<Movie> parseResponseJson(String response) {
    final Map<String, dynamic> responseJson = json.decode(response);
    if (responseJson != null && responseJson.containsKey('results')) {
      Iterable list = responseJson['results'];
      List<Movie> movies = list.map((model) => Movie.fromJson(model)).toList();
      return movies;
    } else {
      return new List();
    }
  }
}
