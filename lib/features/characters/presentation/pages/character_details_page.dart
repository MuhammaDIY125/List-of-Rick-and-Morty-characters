import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/character.dart';
import '/core/widgets/retriable_network_image.dart';
import '/features/favorites/presentation/cubit/favorites_cubit.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({required this.character, super.key});

  final Character character;

  void _showImagePreview(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 320),
        reverseTransitionDuration: const Duration(milliseconds: 240),
        pageBuilder: (context, animation, secondaryAnimation) {
          return _CharacterImagePreview(
            imageUrl: character.image,
            heroTag: 'character_${character.id}_image',
            routeAnimation: animation,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
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
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 420,
              pinned: true,
              stretch: true,
              elevation: 0,
              backgroundColor: colorScheme.surface,
              surfaceTintColor: Colors.transparent,
              // Кнопка назад в стиле iOS
              leading: _AppBarCircleButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.pop(context),
              ),
              actions: [
                _FavoriteAction(character: character),
                const SizedBox(width: 12),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _showImagePreview(context),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: 'character_${character.id}_image',
                        createRectTween: (begin, end) =>
                            MaterialRectCenterArcTween(begin: begin, end: end),
                        child: RetriableNetworkImage(imageUrl: character.image),
                      ),
                      // Затемнение только снизу для читаемости текста
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.6, 1.0],
                            colors: [Colors.transparent, Colors.black87],
                          ),
                        ),
                      ),
                      _HeaderTitleOverlay(character: character),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _InfoSection(
                    title: 'CHARACTER INFO',
                    items: [
                      _InfoRow(
                        icon: Icons.fingerprint_rounded,
                        label: 'Species',
                        value: character.species,
                      ),
                      _InfoRow(
                        icon: Icons.face_unlock_outlined,
                        label: 'Gender',
                        value: character.gender,
                      ),
                      _InfoRow(
                        icon: Icons.info_outline_rounded,
                        label: 'Status',
                        value: character.status,
                        valueColor: _statusColor(character.status),
                      ),
                      _InfoRow(
                        icon: Icons.layers_outlined,
                        label: 'Appearances',
                        value: '${character.episodeCount} episodes',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _InfoSection(
                    title: 'GEOGRAPHY',
                    items: [
                      _InfoRow(
                        icon: Icons.public_rounded,
                        label: 'Origin',
                        value: character.originName,
                      ),
                      _InfoRow(
                        icon: Icons.location_on_rounded,
                        label: 'Last Location',
                        value: character.locationName,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CharacterImagePreview extends StatelessWidget {
  const _CharacterImagePreview({
    required this.imageUrl,
    required this.heroTag,
    required this.routeAnimation,
  });

  final String imageUrl;
  final String heroTag;
  final Animation<double> routeAnimation;

  @override
  Widget build(BuildContext context) {
    final curvedAnimation = CurvedAnimation(
      parent: routeAnimation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: curvedAnimation,
                builder: (context, child) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: 0.78 * curvedAnimation.value,
                      ),
                    ),
                    child: child,
                  );
                },
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).pop(),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).pop(),
                  child: Hero(
                    tag: heroTag,
                    createRectTween: (begin, end) =>
                        MaterialRectCenterArcTween(begin: begin, end: end),
                    child: InteractiveViewer(
                      minScale: 1,
                      maxScale: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.broken_image_outlined,
                              size: 42,
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
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

class _HeaderTitleOverlay extends StatelessWidget {
  final Character character;
  const _HeaderTitleOverlay({required this.character});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: 'character_${character.id}_name',
            child: Text(
              character.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'ID: #${character.id.toString().padLeft(3, '0')}',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _InfoSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Text(
            title,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              final isLast = entry.key == items.length - 1;
              return Column(
                children: [
                  entry.value,
                  if (!isLast)
                    Divider(
                      height: 1,
                      indent: 54,
                      endIndent: 16,
                      color: theme.colorScheme.outlineVariant.withValues(
                        alpha: 0.3,
                      ),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant.withValues(
                      alpha: 0.7,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: valueColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _AppBarCircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(icon, color: Colors.white, size: 18),
              onPressed: onTap,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoriteAction extends StatelessWidget {
  final Character character;
  const _FavoriteAction({required this.character});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Hero(
          tag: 'character_${character.id}_favorite',
          child: _AppBarCircleButton(
            icon: state.isFavorite(character.id)
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            onTap: () =>
                context.read<FavoritesCubit>().toggleFavorite(character),
          ),
        );
      },
    );
  }
}

Color _statusColor(String status) {
  switch (status.toLowerCase()) {
    case 'alive':
      return const Color(0xFF2ECC71);
    case 'dead':
      return const Color(0xFFE74C3C);
    default:
      return const Color(0xFF95A5A6);
  }
}
