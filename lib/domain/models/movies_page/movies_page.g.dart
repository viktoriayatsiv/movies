// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesPage _$MoviesPageFromJson(Map<String, dynamic> json) {
  return MoviesPage(
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
  );
}

Map<String, dynamic> _$MoviesPageToJson(MoviesPage instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
