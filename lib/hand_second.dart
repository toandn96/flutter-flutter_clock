import 'dart:math';

import 'package:flutter/material.dart';

class HandSecondPainter extends CustomPainter {
  final Paint secondHandPaint;
  final Paint secondHandPointsPaint;

  int seconds;

  HandSecondPainter({this.seconds})
      : secondHandPaint = Paint(),
        secondHandPointsPaint = Paint() {
    secondHandPaint.color = Colors.grey;
    secondHandPaint.style = PaintingStyle.stroke;
    secondHandPaint.strokeWidth = 2.0;

    secondHandPointsPaint.color = Colors.black;
    secondHandPointsPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * this.seconds / 60);

    Path path1 = Path();
    Path path2 = Path();
    path1.moveTo(0.0, -radius - 8.0);
    path1.lineTo(0.0, radius / 4 - 30.0);

    // path2.addOval(Rect.fromCircle(radius: 7.0, center: Offset(0.0, -radius)));
    // path2.addOval(Rect.fromCircle(radius: 5.0, center: Offset(0.0, 0.0)));

    canvas.drawPath(path1, secondHandPaint);
    canvas.drawPath(path2, secondHandPointsPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(HandSecondPainter oldDelegate) {
    return this.seconds != oldDelegate.seconds;
  }
}
