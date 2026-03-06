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

    final isPageOne = state.currentPage == 1;

    emit(state.copyWith(status: CharactersStatus.loading));

    try {
      final characters = await _repository.getCharacters(state.currentPage);

      if (characters.isEmpty) {
        emit(
          state.copyWith(hasReachedMax: true, status: CharactersStatus.loaded),
        );
        return;
      }

      final List<Character> updatedCharacters;
      if (isPageOne) {
        updatedCharacters = characters;
      } else {
        // Дедупликация по ID для защиты от повторов
        final characterIds = state.characters.map((c) => c.id).toSet();
        final newCharacters = characters
            .where((c) => !characterIds.contains(c.id))
            .toList();
        updatedCharacters = [...state.characters, ...newCharacters];
      }

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
      } else {
        // Сбрасываем статус в loaded, чтобы можно было попробовать еще раз при скролле
        emit(state.copyWith(status: CharactersStatus.loaded));
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
