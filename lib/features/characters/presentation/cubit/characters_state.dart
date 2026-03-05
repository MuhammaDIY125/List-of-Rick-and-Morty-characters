part of 'characters_cubit.dart';

enum CharactersStatus { initial, loading, loaded, error }

class CharactersState extends Equatable {
  final CharactersStatus status;
  final List<Character> characters;
  final int currentPage;
  final bool hasReachedMax;
  final String? errorMessage;

  const CharactersState({
    this.status = CharactersStatus.initial,
    this.characters = const [],
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.errorMessage,
  });

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    int? currentPage,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    characters,
    currentPage,
    hasReachedMax,
    errorMessage,
  ];
}
