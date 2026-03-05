import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/features/characters/domain/models/character.dart';
import '/features/characters/domain/repositories/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository _repository;

  CharactersCubit({required CharacterRepository repository})
    : _repository = repository,
      super(const CharactersState());

  Future<void> fetchCharacters() async {
    if (state.hasReachedMax || state.status == CharactersStatus.loading) return;

    final isInitial = state.status == CharactersStatus.initial;
    final isPageOne = state.currentPage == 1;

    if (isInitial || (isPageOne && state.characters.isEmpty)) {
      emit(state.copyWith(status: CharactersStatus.loading));
    }

    try {
      final characters = await _repository.getCharacters(state.currentPage);

      if (characters.isEmpty) {
        emit(
          state.copyWith(hasReachedMax: true, status: CharactersStatus.loaded),
        );
        return;
      }

      final updatedCharacters = isPageOne
          ? characters
          : [...state.characters, ...characters];

      emit(
        state.copyWith(
          status: CharactersStatus.loaded,
          characters: updatedCharacters,
          currentPage: state.currentPage + 1,
        ),
      );

      // Фоновое обновление из сети для реализации offline-first
      _backgroundRefresh(state.currentPage - 1);
    } catch (e) {
      if (state.characters.isEmpty) {
        emit(
          state.copyWith(
            status: CharactersStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  Future<void> _backgroundRefresh(int page) async {
    try {
      await _repository.getCharacters(page, forceRefresh: true);
      // В данной реализации мы полагаемся на то, что данные обновлены в кэше.
      // При следующем скролле или обновлении страницы данные будут актуальны.
    } catch (_) {}
  }

  void retry() {
    emit(const CharactersState(status: CharactersStatus.initial));
    fetchCharacters();
  }
}
