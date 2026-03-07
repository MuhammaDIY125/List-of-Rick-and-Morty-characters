import 'package:flutter/material.dart';

class AnimatedFavoriteButton extends StatelessWidget {
  const AnimatedFavoriteButton({
    required this.isFavorite,
    required this.onTap,
    super.key,
    this.showBackground = true,
  });

  final bool isFavorite;
  final VoidCallback onTap;
  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: showBackground ? 0.15 : 0),
          shape: BoxShape.circle,
          border: showBackground
              ? Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1)
              : null,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: isFavorite
              ? TweenAnimationBuilder<double>(
                  key: const ValueKey('fav'),
                  tween: Tween<double>(begin: 0.8, end: 1.0),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.red[400],
                    size: 24,
                  ),
                )
              : Icon(
                  Icons.favorite_border_rounded,
                  key: const ValueKey('unfav'),
                  color: Colors.grey[400],
                  size: 24,
                ),
        ),
      ),
    );
  }
}
