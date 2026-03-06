import 'package:flutter_test/flutter_test.dart';
import 'package:list_of_rick_and_morty_characters/features/characters/domain/models/character.dart';
import 'package:list_of_rick_and_morty_characters/features/characters/domain/repositories/character_repository.dart';
import 'package:list_of_rick_and_morty_characters/features/characters/presentation/cubit/characters_cubit.dart';

class MockCharacterRepository implements CharacterRepository {
  List<Character> mockCharacters = [];
  bool shouldThrowError = false;
  int forceRefreshCount = 0;

  @override
  Future<List<Character>> getCharacters(
    int page, {
    bool forceRefresh = false,
  }) async {
    if (forceRefresh) {
      forceRefreshCount++;
    }

    if (shouldThrowError) {
      throw Exception('Failed to fetch characters');
    }

    if (page == 1) {
      return mockCharacters;
    }

    return [];
  }
}

void main() {
  late CharactersCubit cubit;
  late MockCharacterRepository mockRepository;

  const tCharacter = Character(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    gender: 'Male',
    image: 'image_url',
    originName: 'Earth',
    locationName: 'Citadel',
    episodeCount: 1,
  );

  setUp(() {
    mockRepository = MockCharacterRepository();
    cubit = CharactersCubit(repository: mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('CharactersCubit', () {
    test('initial state should be CharactersStatus.initial', () {
      expect(cubit.state.status, equals(CharactersStatus.initial));
    });

    test(
      'should emit loaded state with characters when fetch is successful',
      () async {
        // Arrange
        mockRepository.mockCharacters = [tCharacter];

        // Act
        final future = cubit.fetchCharacters();

        // Сразу после вызова статус должен быть loading, если изначально initial
        expect(cubit.state.status, equals(CharactersStatus.loading));

        await future;

        // Assert
        expect(cubit.state.status, equals(CharactersStatus.loaded));
        expect(cubit.state.characters.length, 1);
        expect(cubit.state.characters.first.name, 'Rick Sanchez');
        expect(cubit.state.currentPage, 2);
      },
    );

    test(
      'should emit error state when repository throws an exception and list is empty',
      () async {
        // Arrange
        mockRepository.shouldThrowError = true;

        // Act
        await cubit.fetchCharacters();

        // Assert
        expect(cubit.state.status, equals(CharactersStatus.error));
        expect(cubit.state.errorMessage, isNotNull);
      },
    );

    test(
      'should trigger backgroundRefresh using forceRefresh flag after success',
      () async {
        // Arrange
        mockRepository.mockCharacters = [tCharacter];

        // Act
        await cubit.fetchCharacters();

        // Даем микростаску выполниться для backgroundRefresh
        await Future.delayed(Duration.zero);

        // Assert
        expect(mockRepository.forceRefreshCount, 1);
      },
    );
  });
}
