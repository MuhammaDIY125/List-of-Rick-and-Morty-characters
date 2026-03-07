import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/characters/presentation/widgets/character_card.dart';
import '../cubit/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state.status == FavoritesStatus.loading &&
                state.favorites.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == FavoritesStatus.error) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            }

            if (state.favorites.isEmpty) {
              return Center(
                child: Text(
                  'No favorites yet',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            }

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: colorScheme.surface,
                  surfaceTintColor: Colors.transparent,
                  title: Text(
                    'Favorites',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    BlocBuilder<FavoritesCubit, FavoritesState>(
                      builder: (context, state) {
                        return PopupMenuButton<FavoritesSortOrder>(
                          onSelected: (order) {
                            context.read<FavoritesCubit>().sortFavorites(order);
                          },
                          initialValue: state.sortOrder,
                          icon: Icon(
                            Icons.tune_rounded,
                            color: colorScheme.primary,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: FavoritesSortOrder.none,
                              child: Text('Default'),
                            ),
                            const PopupMenuItem(
                              value: FavoritesSortOrder.nameAsc,
                              child: Text('Name (A-Z)'),
                            ),
                            const PopupMenuItem(
                              value: FavoritesSortOrder.nameDesc,
                              child: Text('Name (Z-A)'),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
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
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      return CharacterCard(character: state.favorites[index]);
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
