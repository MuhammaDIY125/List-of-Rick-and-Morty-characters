import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/theme/theme_switcher_button.dart';
import '../cubit/characters_cubit.dart';
import 'character_card.dart';
import 'retry_error_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<CharactersCubit>().fetchCharacters();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 200);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
        centerTitle: true,
        actions: const [ThemeSwitcherButton()],
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state.status == CharactersStatus.initial ||
              (state.status == CharactersStatus.loading &&
                  state.characters.isEmpty)) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == CharactersStatus.error &&
              state.characters.isEmpty) {
            return RetryErrorWidget(
              errorMessage: state.errorMessage,
              onRetry: () => context.read<CharactersCubit>().retry(),
            );
          }

          if (state.characters.isEmpty) {
            return const Center(child: Text('Characters not found'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: state.hasReachedMax
                ? state.characters.length
                : state.characters.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.characters.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return CharacterCard(character: state.characters[index]);
            },
          );
        },
      ),
    );
  }
}
