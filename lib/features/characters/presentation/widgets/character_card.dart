import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/character.dart';
import '/core/widgets/retriable_network_image.dart';
import '/features/favorites/presentation/cubit/favorites_cubit.dart';
import '/features/favorites/presentation/widgets/animated_favorite_button.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Hero(
                  tag: 'character_${character.id}_image',
                  child: RetriableNetworkImage(imageUrl: character.image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Hero(
                  tag: 'character_${character.id}_name',
                  child: Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromRGBO(0, 0, 0, 0.18),
                highlightColor: const Color.fromRGBO(0, 0, 0, 0.1),
                onTap: () => context.push(
                  '/characters/character/${character.id}',
                  extra: character,
                ),
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                final isFavorite = state.isFavorite(character.id);
                return Hero(
                  tag: 'character_${character.id}_favorite',
                  child: AnimatedFavoriteButton(
                    isFavorite: isFavorite,
                    onTap: () {
                      context.read<FavoritesCubit>().toggleFavorite(character);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
