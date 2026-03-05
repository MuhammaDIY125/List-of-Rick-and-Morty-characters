import '/features/characters/domain/models/character.dart';
import '/features/favorites/data/models/favorite_character_entity.dart';

extension FavoriteCharacterMapper on Character {
  FavoriteCharacterEntity toEntity() {
    return FavoriteCharacterEntity()
      ..characterId = id
      ..name = name
      ..image = image
      ..status = status
      ..species = species
      ..gender = gender
      ..originName = originName
      ..locationName = locationName
      ..episodeCount = episodeCount;
  }
}

extension FavoriteCharacterEntityMapper on FavoriteCharacterEntity {
  Character toDomain() {
    return Character(
      id: characterId,
      name: name,
      image: image,
      status: status,
      species: species,
      gender: gender,
      originName: originName,
      locationName: locationName,
      episodeCount: episodeCount,
    );
  }
}
