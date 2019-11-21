import 'dart:math';

import 'package:flutter/material.dart';

class HandMinutePainter extends CustomPainter {
  final Paint minuteHandPaint;
  int minutes;
  int seconds;

  HandMinutePainter({this.minutes, this.seconds}) : minuteHandPaint = Paint() {
    minuteHandPaint.color = Colors.lightBlue;
    minuteHandPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * ((this.minutes + (this.seconds / 60)) / 60));

    Path path = Path();
    path.moveTo(0.0, -radius);
    path.lineTo(-2.0, -radius / 1.8);
    path.lineTo(0.0, 0.0);
    path.lineTo(4.0, 0.0);
    path.lineTo(5.0, -radius / 1.8);
    path.lineTo(2.0, -radius - 0.0);
    path.close();

    canvas.drawPath(path, minuteHandPaint);
    canvas.drawShadow(path, Colors.black, 4.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(HandMinutePainter oldDelegate) {
    return true;
  }
}
