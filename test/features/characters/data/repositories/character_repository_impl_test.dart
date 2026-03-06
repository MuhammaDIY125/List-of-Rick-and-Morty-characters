import 'package:flutter_test/flutter_test.dart';
import 'package:list_of_rick_and_morty_characters/features/characters/data/datasources/character_local_datasource.dart';
import 'package:list_of_rick_and_morty_characters/features/characters/data/datasources/character_remote_datasource.dart';
import 'package:list_of_rick_and_morty_characters/features/characters/data/models/character_dto.dart';
import 'package:list_of_rick_and_morty_characters/features/characters/data/repositories/character_repository_impl.dart';

class MockRemoteDataSource implements CharacterRemoteDataSource {
  final List<CharacterDto> mockData;
  bool wasCalled = false;

  MockRemoteDataSource(this.mockData);

  @override
  Future<List<CharacterDto>> getCharacters(int page) async {
    wasCalled = true;
    return mockData;
  }
}

class MockLocalDataSource implements CharacterLocalDataSource {
  final Map<int, List<CharacterDto>> cache = {};
  bool getCharactersPageCalled = false;
  bool saveCharactersPageCalled = false;

  @override
  Future<List<CharacterDto>?> getCharactersPage(int page) async {
    getCharactersPageCalled = true;
    return cache[page];
  }

  @override
  Future<void> saveCharactersPage(
    int page,
    List<CharacterDto> characters,
  ) async {
    saveCharactersPageCalled = true;
    cache[page] = characters;
  }
}

void main() {
  late MockRemoteDataSource remoteDataSource;
  late MockLocalDataSource localDataSource;
  late CharacterRepositoryImpl repository;

  final tCharacterDto = CharacterDto(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    gender: 'Male',
    image: 'image_url',
    origin: OriginDto(name: 'Earth', url: 'url'),
    location: LocationDto(name: 'Citadel', url: 'url'),
    episode: ['ep1'],
  );

  final tCharacterDtoList = [tCharacterDto];

  setUp(() {
    remoteDataSource = MockRemoteDataSource(tCharacterDtoList);
    localDataSource = MockLocalDataSource();
    repository = CharacterRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
    );
  });

  group('CharacterRepositoryImpl getCharacters', () {
    test(
      'should return remote data when cache is empty and save to cache',
      () async {
        // Act
        final result = await repository.getCharacters(1);

        // Assert
        expect(result.length, 1);
        expect(result.first.name, 'Rick Sanchez');

        expect(localDataSource.getCharactersPageCalled, isTrue);
        expect(remoteDataSource.wasCalled, isTrue);
        expect(localDataSource.saveCharactersPageCalled, isTrue);
        expect(localDataSource.cache[1], equals(tCharacterDtoList));
      },
    );

    test('should return cached data when cache is not empty', () async {
      // Arrange
      await localDataSource.saveCharactersPage(1, tCharacterDtoList);
      localDataSource.saveCharactersPageCalled = false; // Reset flag

      // Act
      final result = await repository.getCharacters(1);

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'Rick Sanchez');

      expect(localDataSource.getCharactersPageCalled, isTrue);
      expect(remoteDataSource.wasCalled, isFalse);
      expect(localDataSource.saveCharactersPageCalled, isFalse);
    });

    test(
      'should return remote data when forceRefresh is true even if cache is not empty',
      () async {
        // Arrange
        await localDataSource.saveCharactersPage(1, []); // Намеренно пустой кеш
        localDataSource.saveCharactersPageCalled = false; // Reset flag

        // Act
        final result = await repository.getCharacters(1, forceRefresh: true);

        // Assert
        expect(result.length, 1);
        expect(result.first.name, 'Rick Sanchez');

        expect(
          localDataSource.getCharactersPageCalled,
          isFalse,
        ); // Не должен проверять кеш
        expect(remoteDataSource.wasCalled, isTrue);
        expect(
          localDataSource.saveCharactersPageCalled,
          isTrue,
        ); // Должен обновить кеш
        expect(localDataSource.cache[1], equals(tCharacterDtoList));
      },
    );
  });
}
