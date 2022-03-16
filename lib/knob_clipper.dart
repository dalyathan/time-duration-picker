import 'package:flutter/material.dart';
import 'dart:math';

class KnobClipper extends CustomClipper<Path> {
  double startAngle;
  double endAngle;
  final double brushSize;

  KnobClipper(this.startAngle, this.endAngle, this.brushSize);
  @override
  Path getClip(Size size) {
    double sweepAngle = endAngle - startAngle;
    if (sweepAngle < 0) {
      sweepAngle = 2 * pi + (endAngle - startAngle);
    }
    double radius = size.width / 2;
    Offset center = Offset(radius, radius);
    Path trianglePath = Path()
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
      ], false);
    Path startIconBackground = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(
            (radius - (radius - brushSize * 0.5) * cos(startAngle + pi / 2)),
            (radius - (radius - brushSize * 0.5) * sin(startAngle + pi / 2)),
          ),
          radius: brushSize * 0.5));
    Path endIconBackground = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(
            (radius - (radius - brushSize * 0.5) * cos(endAngle + pi / 2)),
            (radius - (radius - brushSize * 0.5) * sin(endAngle + pi / 2)),
          ),
          radius: brushSize * 0.5));
    Path outerCirclePath = Path()
      ..arcTo(Rect.fromCircle(center: center, radius: radius),
          startAngle - pi / 2, sweepAngle, false);
    return Path.combine(
        PathOperation.union,
        startIconBackground,
        Path.combine(
          PathOperation.union,
          endIconBackground,
          Path.combine(PathOperation.xor, trianglePath, outerCirclePath),
        ));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
