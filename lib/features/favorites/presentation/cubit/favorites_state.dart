part of 'favorites_cubit.dart';

enum FavoritesStatus { initial, loading, loaded, error }

enum FavoritesSortOrder { none, nameAsc, nameDesc }

class FavoritesState extends Equatable {
  final FavoritesStatus status;
  final List<Character> favorites;
  final String? errorMessage;
  final FavoritesSortOrder sortOrder;

  const FavoritesState({
    this.status = FavoritesStatus.initial,
    this.favorites = const [],
    this.errorMessage,
    this.sortOrder = FavoritesSortOrder.none,
  });

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<Character>? favorites,
    String? errorMessage,
    FavoritesSortOrder? sortOrder,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
      errorMessage: errorMessage ?? this.errorMessage,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  bool isFavorite(int characterId) {
    return favorites.any((char) => char.id == characterId);
  }

  @override
  List<Object?> get props => [status, favorites, errorMessage, sortOrder];
}
