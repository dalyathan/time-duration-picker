import 'package:flutter/material.dart';
import 'dart:math';

class KnobPainter extends CustomClipper<Path> {
  double startAngle;
  double endAngle;
  final double brushSize;

  KnobPainter(this.startAngle, this.endAngle, this.brushSize);
  @override
  Path getClip(Size size) {
    double sweepAngle = endAngle - startAngle;
    if (sweepAngle < 0) {
      sweepAngle = 2 * pi + (endAngle - startAngle);
    }
    double radius = size.width / 2;
    Offset center = Offset(radius, radius);
    return Path.combine(
        PathOperation.xor,
        Path()
          ..addPolygon([
            center,
            Offset(
              radius * (1 - cos(startAngle + pi / 2)),
              radius * (1 - sin(startAngle + pi / 2)),
            ),
            Offset(
              radius * (1 - cos(endAngle + pi / 2)),
              radius * (1 - sin(endAngle + pi / 2)),
            ),
          ], false),
        Path()
          ..arcTo(Rect.fromCircle(center: center, radius: radius),
              startAngle - pi / 2, sweepAngle, false));
    // return Path()
    //   ..arcTo(Rect.fromCircle(center: center, radius: radius),
    //       startAngle - pi / 2, sweepAngle, false);
    // Paint brush = Paint();
    // brush.color = Colors.transparent;
    // brush.strokeWidth = brushSize;
    // brush.strokeCap = StrokeCap.round;
    // brush.style = PaintingStyle.stroke;
    //    double sweepAngle = endAngle - startAngle;
    // if (sweepAngle < 0) {
    //   sweepAngle = 2 * pi + (endAngle - startAngle);
    // }
    // canvas.drawArc(
    //     Rect.fromCircle(
    //         center: Offset(size.width / 2, size.height / 2),
    //         radius: (size.width - brushSize) * 0.5),
    //     -pi / 2 + startAngle,
    //     sweepAngle,
    //     false,
    //     brush);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
