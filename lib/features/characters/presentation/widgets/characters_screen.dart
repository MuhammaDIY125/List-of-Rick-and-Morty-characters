import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/characters_cubit.dart';
import 'character_card.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick and Morty'), centerTitle: true),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          // Начальная загрузка
          if (state.status == CharactersStatus.initial ||
              (state.status == CharactersStatus.loading &&
                  state.characters.isEmpty)) {
            return const Center(child: CircularProgressIndicator());
          }

          // Ошибка при пустом списке
          if (state.status == CharactersStatus.error &&
              state.characters.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${state.errorMessage}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<CharactersCubit>().retry(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Пустой список
          if (state.characters.isEmpty) {
            return const Center(child: Text('Characters not found'));
          }

          // Список персонажей
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.characters.length,
            itemBuilder: (context, index) {
              return CharacterCard(character: state.characters[index]);
            },
          );
        },
      ),
    );
  }
}
