import 'package:flutter/material.dart';

class AnimatedFavoriteButton extends StatelessWidget {
  const AnimatedFavoriteButton({
    required this.isFavorite,
    required this.onTap,
    super.key,
  });

  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: AnimatedSwitcher(
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
                  return Transform.rotate(
                    angle: value * 6.28, // 2 * pi
                    child: Transform.scale(scale: value, child: child),
                  );
                },
                child: const Icon(Icons.star, color: Colors.amber, size: 28),
              )
            : const Icon(
                Icons.star_border,
                key: ValueKey('unfav'),
                color: Colors.grey,
                size: 28,
              ),
      ),
    );
  }
}
