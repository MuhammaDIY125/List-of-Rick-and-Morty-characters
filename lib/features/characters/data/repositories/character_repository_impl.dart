import 'dart:developer' as developer;

import '/core/network/exceptions.dart';
import '/features/characters/data/datasources/character_local_datasource.dart';
import '/features/characters/data/datasources/character_remote_datasource.dart';
import '/features/characters/data/mappers/character_mapper.dart';
import '/features/characters/domain/models/character.dart';
import '/features/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource _remoteDataSource;
  final CharacterLocalDataSource _localDataSource;

  CharacterRepositoryImpl({
    required CharacterRemoteDataSource remoteDataSource,
    required CharacterLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<List<Character>> getCharacters(
    int page, {
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        // 1. Проверяем локальный кэш
        final cachedDtos = await _localDataSource.getCharactersPage(page);

        if (cachedDtos != null) {
          developer.log(
            'Using cached data for page $page',
            name: 'CharacterRepositoryImpl',
          );
          return cachedDtos.map((dto) => dto.toDomain()).toList();
        }
      }

      // 2. Загружаем из сети
      developer.log(
        'Fetching from network for page $page',
        name: 'CharacterRepositoryImpl',
      );
      final remoteDtos = await _remoteDataSource.getCharacters(page);

      // 3. Обновляем кэш
      await _localDataSource.saveCharactersPage(page, remoteDtos);

      return remoteDtos.map((dto) => dto.toDomain()).toList();
    } on NetworkException {
      // Пробрасываем типизированные сетевые ошибки дальше
      rethrow;
    } catch (e) {
      developer.log(
        'Unexpected error in repository',
        name: 'CharacterRepositoryImpl',
        error: e,
      );
      throw UnknownException(message: 'Failed to get characters');
    }
  }
}
