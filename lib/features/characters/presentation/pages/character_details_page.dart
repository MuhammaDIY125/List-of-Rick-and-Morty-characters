import 'package:flutter/material.dart';

import '../../domain/models/character.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                character.image,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) =>
                    const Icon(Icons.person, size: 100),
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
