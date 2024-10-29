import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class HalfPainter extends CustomPainter {
  late final Paint arcPaint;

  HalfPainter({
    required Color paintColor,
  }) {
    arcPaint = Paint()..color = paintColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // ignore: omit_local_variable_types
    final Rect beforeRect = Rect.fromLTWH(
      0,
      (size.height / 2) - 10,
      10,
      10,
    );
    // ignore: omit_local_variable_types
    final Rect largeRect = Rect.fromLTWH(
      10,
      0,
      size.width - 20,
      70,
    );
    // ignore: omit_local_variable_types
    final Rect afterRect = Rect.fromLTWH(
      size.width - 10,
      (size.height / 2) - 10,
      10,
      10,
    );

    // ignore: omit_local_variable_types
    final Path path = Path();
    path.arcTo(beforeRect, radians(0), radians(90), false);
    path.lineTo(20, size.height / 2);
    path.arcTo(largeRect, radians(0), -radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, radians(180), radians(-90), false);
    path.close();

    canvas.drawPath(path, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
