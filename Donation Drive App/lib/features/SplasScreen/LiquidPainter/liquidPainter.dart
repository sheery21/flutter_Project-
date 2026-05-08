import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiquidPainter extends CustomPainter {
  final double progress;

  LiquidPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;

    final center = Offset(size.width / 2, size.height / 2);

    // max radius = screen diagonal
    final maxRadius = sqrt(size.width * size.width + size.height * size.height);

    final radius = maxRadius * progress;

    // LIQUID CIRCLE
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant LiquidPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
