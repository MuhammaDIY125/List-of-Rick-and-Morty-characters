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
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: showBackground ? 0.05 : 0),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: isFavorite
              ? TweenAnimationBuilder<double>(
                  key: const ValueKey('fav'),
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 28,
                  ),
                )
              : const Icon(
                  Icons.favorite_border,
                  key: ValueKey('unfav'),
                  color: Colors.grey,
                  size: 28,
                ),
        ),
      ),
    );
  }
}
