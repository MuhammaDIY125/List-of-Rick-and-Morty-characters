import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/characters/presentation/widgets/character_card.dart';
import '../cubit/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'), centerTitle: true),
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

          return ListView.builder(
            padding: const EdgeInsets.all(16),
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
