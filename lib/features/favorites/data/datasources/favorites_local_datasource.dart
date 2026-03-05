import 'package:isar_community/isar.dart';

import '/features/favorites/data/models/favorite_character_entity.dart';

abstract class FavoritesLocalDataSource {
  Future<List<FavoriteCharacterEntity>> getFavorites();
  Future<void> addToFavorites(FavoriteCharacterEntity character);
  Future<void> removeFromFavorites(int characterId);
  Future<bool> isFavorite(int characterId);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final Isar _isar;

  FavoritesLocalDataSourceImpl({required Isar isar}) : _isar = isar;

  @override
  Future<List<FavoriteCharacterEntity>> getFavorites() {
    return _isar.favoriteCharacterEntitys.where().findAll();
  }

  @override
  Future<void> addToFavorites(FavoriteCharacterEntity character) async {
    await _isar.writeTxn(() async {
      await _isar.favoriteCharacterEntitys.put(character);
    });
  }

  @override
  Future<void> removeFromFavorites(int characterId) async {
    await _isar.writeTxn(() async {
      await _isar.favoriteCharacterEntitys
          .filter()
          .characterIdEqualTo(characterId)
          .deleteFirst();
    });
  }

  @override
  Future<bool> isFavorite(int characterId) async {
    final count = await _isar.favoriteCharacterEntitys
        .filter()
        .characterIdEqualTo(characterId)
        .count();
    return count > 0;
  }
}
