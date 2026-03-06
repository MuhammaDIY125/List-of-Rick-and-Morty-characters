import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/character.dart';
import '/features/favorites/presentation/cubit/favorites_cubit.dart';
import '/features/favorites/presentation/widgets/animated_favorite_button.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => context.push(
          '/characters/character/${character.id}',
          extra: character,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Аватар персонажа
              SizedBox(
                width: 120,
                child: Hero(
                  tag: 'character_${character.id}',
                  child: Image.network(
                    character.image,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, stack) => const Icon(Icons.person),
                  ),
                ),
              ),
              // Информация о персонаже
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              character.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          BlocBuilder<FavoritesCubit, FavoritesState>(
                            builder: (context, state) {
                              final isFavorite = state.isFavorite(character.id);
                              return AnimatedFavoriteButton(
                                isFavorite: isFavorite,
                                onTap: () {
                                  context.read<FavoritesCubit>().toggleFavorite(
                                    character,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      _StatusRow(
                        status: character.status,
                        species: character.species,
                      ),
                      const Spacer(),
                      const Text(
                        'Last known location:',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        character.locationName,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String status;
  final String species;

  const _StatusRow({required this.status, required this.species});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getStatusColor(status),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '$status - $species',
            style: const TextStyle(fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
