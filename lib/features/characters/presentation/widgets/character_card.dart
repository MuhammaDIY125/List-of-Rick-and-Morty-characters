import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => context.push('/character/${character.id}'),
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
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
