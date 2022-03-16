import 'package:flutter/material.dart';

import 'clock_numbers.dart';

class Clock extends StatelessWidget {
  final double radius;
  final TextStyle? clockTextStyle;
  const Clock({Key? key, required this.radius, this.clockTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      child: Center(child: ClockNumbers(width: radius)),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(241, 248, 255, 1),
      ),
    );
  }
}
