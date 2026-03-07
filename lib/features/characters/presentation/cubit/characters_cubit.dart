import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '/core/network/exceptions.dart';
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
    } on ConnectionException {
      _handleError('No internet connection', isPageOne);
    } on TimeoutException {
      _handleError('Request timeout. Please try again', isPageOne);
    } on ServerException {
      _handleError('Server error. Please try again later', isPageOne);
    } on ClientException catch (e) {
      _handleError(e.message, isPageOne);
    } on ParseException {
      _handleError('Failed to load characters', isPageOne);
    } catch (e) {
      developer.log(
        'Unexpected error in fetchCharacters',
        error: e,
        name: 'CharactersCubit',
      );
      _handleError('Unknown error', isPageOne);
    }
  }

  /// Обработка ошибок: если это первая страница, показываем ошибку; иначе сохраняем статус loaded
  void _handleError(String errorMessage, bool isFirstPage) {
    if (isFirstPage) {
      emit(
        state.copyWith(
          status: CharactersStatus.error,
          errorMessage: errorMessage,
        ),
      );
    } else {
      // Если это не первая страница, просто возвращаемся в loaded для повторной попытки
      emit(state.copyWith(status: CharactersStatus.loaded));
    }
  }

  void retry() {
    emit(const CharactersState(status: CharactersStatus.initial));
    fetchCharacters();
  }
}
