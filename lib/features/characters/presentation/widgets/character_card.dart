import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/models/character.dart';
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
      child: InkWell(
        onTap: () => context.push(
          '/characters/character/${character.id}',
          extra: character,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Изображение с кнопкой избранного
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
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
                              size: 48,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'No image',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Кнопка избранного в правом верхнем углу
                  Positioned(
                    top: 4,
                    right: 4,
                    child: BlocBuilder<FavoritesCubit, FavoritesState>(
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
                  ),
                ],
              ),
            ),
            // Имя персонажа
            Padding(
              padding: const EdgeInsets.all(8),
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
          ],
        ),
      ),
    );
  }
}
