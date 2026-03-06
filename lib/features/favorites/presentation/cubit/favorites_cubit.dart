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
      emit(
        state.copyWith(status: FavoritesStatus.loaded, favorites: favorites),
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
