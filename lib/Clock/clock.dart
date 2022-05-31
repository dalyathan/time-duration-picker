import 'package:flutter/material.dart';

import 'clock_numbers.dart';

class Clock extends StatelessWidget {
  final double radius;
  final TextStyle? clockTextStyle;
  final BoxDecoration? clockDecoration;
  final bool twelveHourClock;

  const Clock({
    Key? key,
    required this.radius,
    this.clockTextStyle,
    this.clockDecoration,
    this.twelveHourClock = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      child: Center(
        child: CustomPaint(painter:
          ClockNumbers(radius: radius, clockTextStyle: clockTextStyle, twelveHourClock: twelveHourClock,)
        )
      ),
      decoration: clockDecoration != null
        ? clockDecoration!.copyWith(shape: BoxShape.circle)
        : const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(241, 248, 255, 1),
        ),
    );
  }
}
