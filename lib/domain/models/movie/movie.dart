import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  final int id;
  final String title;
  final bool adult;
  final String overview;
  final List<int> genreIds;
  final String originalTitle;
  final String originalLanguage;
  String backdropPath;
  String posterPath;
  final num popularity;
  final int voteCount;
  final num voteAverage;
  final bool video;

  Movie(
      {this.id,
      this.title,
      this.adult,
      this.overview,
      this.genreIds,
      this.originalTitle,
      this.originalLanguage,
      this.backdropPath,
      this.posterPath,
      this.popularity,
      this.voteCount,
      this.voteAverage,
      this.video});
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
