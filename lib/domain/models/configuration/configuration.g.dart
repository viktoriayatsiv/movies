// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return Configuration(
    images: json['images'] == null
        ? null
        : ImageConfiguration.fromJson(json['images'] as Map<String, dynamic>),
    changeKeys:
        (json['change_keys'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{
      'images': instance.images,
      'change_keys': instance.changeKeys,
    };
