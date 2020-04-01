import 'package:json_annotation/json_annotation.dart';
import 'package:movies/domain/models/movie/movie.dart';

part 'movies_page.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MoviesPage {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MoviesPage(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,});
  factory MoviesPage.fromJson(Map<String, dynamic> json) => _$MoviesPageFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesPageToJson(this);
}
