import 'package:json_annotation/json_annotation.dart';
import 'package:movies/domain/models/image_configuration/image_configuration.dart';
part 'configuration.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Configuration {
  final ImageConfiguration images;
  final List<String> changeKeys;

  Configuration({this.images, this.changeKeys});
  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}
