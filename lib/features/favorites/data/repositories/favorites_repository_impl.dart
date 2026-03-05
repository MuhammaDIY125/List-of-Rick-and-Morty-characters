import '/features/characters/domain/models/character.dart';
import '/features/favorites/data/datasources/favorites_local_datasource.dart';
import '/features/favorites/data/mappers/favorite_mapper.dart';
import '/features/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource _localDataSource;

  FavoritesRepositoryImpl({required FavoritesLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  @override
  Future<List<Character>> getFavorites() async {
    final entities = await _localDataSource.getFavorites();
    return entities.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> addToFavorites(Character character) async {
    await _localDataSource.addToFavorites(character.toEntity());
  }

  @override
  Future<void> removeFromFavorites(int characterId) async {
    await _localDataSource.removeFromFavorites(characterId);
  }

  @override
  Future<bool> isFavorite(int characterId) async {
    return _localDataSource.isFavorite(characterId);
  }
}
