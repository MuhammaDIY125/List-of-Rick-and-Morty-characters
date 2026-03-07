import 'dart:math';

import 'package:flutter/material.dart';

class RetriableNetworkImage extends StatefulWidget {
  const RetriableNetworkImage({
    required this.imageUrl,
    super.key,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final BoxFit fit;

  @override
  State<RetriableNetworkImage> createState() => _RetriableNetworkImageState();
}

class _RetriableNetworkImageState extends State<RetriableNetworkImage> {
  int _attempt = 0;
  bool _isRetryScheduled = false;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imageUrl,
      key: ValueKey(_attempt),
      fit: widget.fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(color: Colors.white);
      },
      errorBuilder: (context, error, stackTrace) {
        _scheduleRetry();
        return Container(color: Colors.white);
      },
    );
  }

  void _scheduleRetry() {
    if (_isRetryScheduled) return;
    _isRetryScheduled = true;

    final expBackoff = 400 * pow(2, min(_attempt, 5)).toInt();
    final delay = Duration(milliseconds: expBackoff);

    Future.delayed(delay, () {
      if (!mounted) return;

      // Clear any failed decode/provider state before retrying same URL.
      PaintingBinding.instance.imageCache.evict(NetworkImage(widget.imageUrl));

      setState(() {
        _attempt += 1;
        _isRetryScheduled = false;
      });
    });
  }
}
