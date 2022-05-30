import 'dart:math';

import 'package:flutter/material.dart';

class ClockNumbers extends CustomPainter {
  final double radius;
  final TextStyle? clockTextStyle;
  final bool twelveHourClock;

  const ClockNumbers({
    required this.radius,
    this.clockTextStyle,
    this.twelveHourClock = true
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double _kPiByTwo = pi / 2;
    const double _kTwoPi = 2 * pi;
    final Offset center = Offset(size.width / 2.0, size.height / 2.0);

    // Get the offset point for an angle value of theta, and a distance of _radius
    Offset getOffsetForTheta(double theta, double _radius) {
      return center + Offset(_radius * cos(theta), -_radius * sin(theta));
    }

    double fontSize = radius * 0.08;
    TextStyle textStyle = clockTextStyle != null
      ? clockTextStyle!.copyWith(fontSize: fontSize)
      : TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize);

    List<String> hours = <String>[
      twelveHourClock ? "12 AM" : "0",
      "2",
      "4",
      twelveHourClock ? "6 AM" : "6",
      "8",
      "10",
      twelveHourClock ? "12 PM" : "12",
      twelveHourClock ? "2" : "14",
      twelveHourClock ? "4" : "16",
      twelveHourClock ? "6 PM" : "18",
      twelveHourClock ? "8" : "20",
      twelveHourClock ? "10" : "22",
    ];

    // Converting String to TextPainter
    final List<TextPainter> labels = <TextPainter>[];
    for (String value in hours) {
      var painter = TextPainter(
        text: TextSpan(style: textStyle, text: value),
        textDirection: TextDirection.ltr,
      )..layout();
      labels.add(painter);
    }

    // Paint the labels
    void paintLabels(List<TextPainter> labels) {
      final double labelThetaIncrement = -_kTwoPi / labels.length;
      double labelTheta = _kPiByTwo;

      for (TextPainter label in labels) {
        final Offset labelOffset = Offset(-label.width / 2.0, -label.height / 2.0);
        label.paint(canvas, getOffsetForTheta(labelTheta, (radius/2) - 40.0) + labelOffset);
        labelTheta += labelThetaIncrement;
      }
    }

    paintLabels(labels);
  }

  @override
  bool shouldRepaint(ClockNumbers oldDelegate) {
    return false;
  }
}
