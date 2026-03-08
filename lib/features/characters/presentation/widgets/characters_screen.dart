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
  DateTime? _lastFetchTime;
  bool _isViewportPrefetchScheduled = false;
  static const Duration _fetchThrottle = Duration(milliseconds: 500);

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
    if (!_isBottom) return;

    final now = DateTime.now();
    if (_lastFetchTime != null &&
        now.difference(_lastFetchTime!) < _fetchThrottle) {
      return; // Ещё не прошло 500ms с последнего запроса
    }

    _lastFetchTime = now;
    context.read<CharactersCubit>().fetchCharacters();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 200);
  }

  void _maybePrefetchForLargeViewport(CharactersState state) {
    if (_isViewportPrefetchScheduled) return;
    if (state.hasReachedMax || state.status != CharactersStatus.loaded) return;

    _isViewportPrefetchScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isViewportPrefetchScheduled = false;
      if (!mounted || !_scrollController.hasClients) return;

      // If the grid is still not scrollable, fetch next page automatically.
      final isScrollable = _scrollController.position.maxScrollExtent > 0;
      if (!isScrollable) {
        context.read<CharactersCubit>().fetchCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorScheme.surface, colorScheme.surfaceContainerLowest],
          ),
        ),
        child: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            _maybePrefetchForLargeViewport(state);

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
              return const Center(child: Text('No characters found'));
            }

            return CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: colorScheme.surface,
                  surfaceTintColor: Colors.transparent,
                  title: Text(
                    'Rick and Morty',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  centerTitle: true,
                  actions: const [ThemeSwitcherButton()],
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
