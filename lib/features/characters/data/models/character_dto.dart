import 'package:json_annotation/json_annotation.dart';

part 'character_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CharacterDto {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final OriginDto origin;
  final LocationDto location;
  final List<String> episode;

  CharacterDto({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episode,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OriginDto {
  final String name;
  final String url;

  OriginDto({required this.name, required this.url});

  factory OriginDto.fromJson(Map<String, dynamic> json) =>
      _$OriginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OriginDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationDto {
  final String name;
  final String url;

  LocationDto({required this.name, required this.url});

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}
