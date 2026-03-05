import '/features/characters/domain/models/character.dart';

abstract class FavoritesRepository {
  Future<List<Character>> getFavorites();
  Future<void> addToFavorites(Character character);
  Future<void> removeFromFavorites(int characterId);
  Future<bool> isFavorite(int characterId);
}
