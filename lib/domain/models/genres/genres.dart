import 'package:json_annotation/json_annotation.dart';
import 'package:movies/domain/models/genre/genre.dart';
part 'genres.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Genres {
  final List<Genre> genres;

  Genres({this.genres});
  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
  Map<String, dynamic> toJson() => _$GenresToJson(this);
}
