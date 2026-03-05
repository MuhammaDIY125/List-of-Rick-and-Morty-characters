import '/features/characters/domain/models/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters(int page, {bool forceRefresh = false});
}
