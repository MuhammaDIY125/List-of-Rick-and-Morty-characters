import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/features/characters/domain/models/character.dart';
import '/features/favorites/domain/repositories/favorites_repository.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository _repository;

  FavoritesCubit({required FavoritesRepository repository})
    : _repository = repository,
      super(const FavoritesState());

  Future<void> loadFavorites() async {
    emit(state.copyWith(status: FavoritesStatus.loading));
    try {
      final favorites = await _repository.getFavorites();

      final sortedFavorites = _sortFavoritesList(favorites, state.sortOrder);

      emit(
        state.copyWith(
          status: FavoritesStatus.loaded,
          favorites: sortedFavorites,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void sortFavorites(FavoritesSortOrder order) {
    if (state.status != FavoritesStatus.loaded) return;

    final sortedFavorites = _sortFavoritesList(state.favorites, order);
    emit(state.copyWith(sortOrder: order, favorites: sortedFavorites));
  }

  List<Character> _sortFavoritesList(
    List<Character> list,
    FavoritesSortOrder order,
  ) {
    if (order == FavoritesSortOrder.none || list.isEmpty) return list;

    final newList = List<Character>.from(list);
    if (order == FavoritesSortOrder.nameAsc) {
      newList.sort((a, b) => a.name.compareTo(b.name));
    } else {
      newList.sort((a, b) => b.name.compareTo(a.name));
    }
    return newList;
  }

  Future<void> toggleFavorite(Character character) async {
    try {
      final isFav = state.isFavorite(character.id);

      if (isFav) {
        await _repository.removeFromFavorites(character.id);
      } else {
        await _repository.addToFavorites(character);
      }

      await loadFavorites();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoritesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
