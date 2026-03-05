// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) => CharacterDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  species: json['species'] as String,
  gender: json['gender'] as String,
  image: json['image'] as String,
  origin: OriginDto.fromJson(json['origin'] as Map<String, dynamic>),
  location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
  episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CharacterDtoToJson(CharacterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'image': instance.image,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episode,
    };

OriginDto _$OriginDtoFromJson(Map<String, dynamic> json) =>
    OriginDto(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$OriginDtoToJson(OriginDto instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) =>
    LocationDto(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
