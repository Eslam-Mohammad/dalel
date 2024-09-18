import 'package:dalel/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TwoLineMenuIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.fontSecondaryColor
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final double lineLength = size.width * 0.8;
    final double lineSpacing = size.height * 0.3;

    // Draw the first line
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.3),
      Offset(size.width * 0.2 + lineLength, size.height * 0.3),
      paint,
    );

    // Draw the second line
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.7),
      Offset(size.width * 0.2 + lineLength, size.height * 0.7),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}