import 'dart:convert';
import 'dart:developer';

import 'package:isar_community/isar.dart';

import '/features/characters/data/models/character_cache_page_entity.dart';
import '/features/characters/data/models/character_dto.dart';

abstract class CharacterLocalDataSource {
  Future<void> saveCharactersPage(int page, List<CharacterDto> characters);
  Future<List<CharacterDto>?> getCharactersPage(int page);
}

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final Isar _isar;

  CharacterLocalDataSourceImpl({required Isar isar}) : _isar = isar;

  @override
  Future<List<CharacterDto>?> getCharactersPage(int page) async {
    log('Read cache for page=$page', name: 'CharacterLocalDataSource');
    final cachedPage = await _isar.characterCachePageEntitys
        .filter()
        .pageEqualTo(page)
        .findFirst();

    if (cachedPage == null) {
      log('Cache miss for page=$page', name: 'CharacterLocalDataSource');
      return null;
    }

    try {
      final decoded = jsonDecode(cachedPage.payload);
      if (decoded is! List) {
        log(
          'Cache payload is not a list for page=$page',
          name: 'CharacterLocalDataSource',
        );
        return null;
      }

      final characters = decoded
          .map((item) => CharacterDto.fromJson(item as Map<String, dynamic>))
          .toList();

      log(
        'Cache hit for page=$page, items=${characters.length}',
        name: 'CharacterLocalDataSource',
      );
      return characters;
    } catch (error, stackTrace) {
      log(
        'Failed to decode cache for page=$page',
        name: 'CharacterLocalDataSource',
        error: error,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  @override
  Future<void> saveCharactersPage(
    int page,
    List<CharacterDto> characters,
  ) async {
    log(
      'Save cache for page=$page, items=${characters.length}',
      name: 'CharacterLocalDataSource',
    );
    final entity = CharacterCachePageEntity()
      ..page = page
      ..payload = jsonEncode(
        characters.map((character) => character.toJson()).toList(),
      );

    await _isar.writeTxn(() async {
      await _isar.characterCachePageEntitys.put(entity);
    });
    log('Cache saved for page=$page', name: 'CharacterLocalDataSource');
  }
}
