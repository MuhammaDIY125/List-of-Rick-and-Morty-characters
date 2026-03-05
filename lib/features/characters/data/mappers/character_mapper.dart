import '/features/characters/data/models/character_dto.dart';
import '/features/characters/domain/models/character.dart';

extension CharacterMapper on CharacterDto {
  Character toDomain() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      gender: gender,
      image: image,
      originName: origin.name,
      locationName: location.name,
      episodeCount: episode.length,
    );
  }
}
