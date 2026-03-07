import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/models/character.dart';
import '/features/favorites/presentation/cubit/favorites_cubit.dart';
import '/features/favorites/presentation/widgets/animated_favorite_button.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        actions: [
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              final isFavorite = state.isFavorite(character.id);
              return AnimatedFavoriteButton(
                showBackground: false,
                isFavorite: isFavorite,
                onTap: () {
                  context.read<FavoritesCubit>().toggleFavorite(character);
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Hero(
                tag: 'character_${character.id}',
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(color: Colors.white),
                    );
                  },
                  errorBuilder: (ctx, err, stack) => Container(
                    color: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image,
                          size: 100,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Failed to load image',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoRow(title: 'Status', value: character.status),
                      const Divider(),
                      _InfoRow(title: 'Species', value: character.species),
                      const Divider(),
                      _InfoRow(title: 'Gender', value: character.gender),
                      const Divider(),
                      _InfoRow(title: 'Origin', value: character.originName),
                      const Divider(),
                      _InfoRow(
                        title: 'Location',
                        value: character.locationName,
                      ),
                      const Divider(),
                      _InfoRow(
                        title: 'Episodes',
                        value: character.episodeCount.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
