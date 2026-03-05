import '/features/characters/data/models/character_dto.dart';

abstract class CharacterLocalDataSource {
  Future<void> saveCharactersPage(int page, List<CharacterDto> characters);
  Future<List<CharacterDto>?> getCharactersPage(int page);
}

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  /// Временный кэш, потом поменяем на бд
  final Map<int, List<CharacterDto>> _cache = {};

  @override
  Future<List<CharacterDto>?> getCharactersPage(int page) async {
    return _cache[page];
  }

  @override
  Future<void> saveCharactersPage(
    int page,
    List<CharacterDto> characters,
  ) async {
    _cache[page] = characters;
  }
}
