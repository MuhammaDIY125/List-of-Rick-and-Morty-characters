import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/characters/presentation/widgets/character_card.dart';
import '../cubit/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        actions: [
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              return PopupMenuButton<FavoritesSortOrder>(
                onSelected: (order) {
                  context.read<FavoritesCubit>().sortFavorites(order);
                },
                initialValue: state.sortOrder,
                icon: const Icon(Icons.sort),
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
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.status == FavoritesStatus.loading &&
              state.favorites.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == FavoritesStatus.error) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          if (state.favorites.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              return CharacterCard(character: state.favorites[index]);
            },
          );
        },
      ),
    );
  }
}
