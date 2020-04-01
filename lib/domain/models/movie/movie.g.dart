// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    title: json['title'] as String,
    adult: json['adult'] as bool,
    overview: json['overview'] as String,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    originalTitle: json['original_title'] as String,
    originalLanguage: json['original_language'] as String,
    backdropPath: json['backdrop_path'] as String,
    posterPath: json['poster_path'] as String,
    popularity: json['popularity'] as num,
    voteCount: json['vote_count'] as int,
    voteAverage: json['vote_average'] as num,
    video: json['video'] as bool,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'adult': instance.adult,
      'overview': instance.overview,
      'genre_ids': instance.genreIds,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'video': instance.video,
    };
