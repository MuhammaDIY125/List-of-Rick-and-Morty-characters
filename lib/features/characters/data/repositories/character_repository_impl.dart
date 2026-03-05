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
  Future<List<Character>> getCharacters(int page) async {
    // 1. Проверяем локальный кэш
    final cachedDtos = await _localDataSource.getCharactersPage(page);

    // Если данные в кэше есть, мы немедленно возвращаем их в этой реализации Future.
    // Логика «параллельного вызова API» будет обрабатываться на уровне Cubit,
    // чтобы позволить UI сначала отобразить кэш, а затем обновиться из сети.
    if (cachedDtos != null) {
      return cachedDtos.map((dto) => dto.toDomain()).toList();
    }

    // 2. Если кэш пуст, загружаем данные из удаленного источника
    final remoteDtos = await _remoteDataSource.getCharacters(page);

    // 3. Обновляем кэш
    await _localDataSource.saveCharactersPage(page, remoteDtos);

    return remoteDtos.map((dto) => dto.toDomain()).toList();
  }
}
