library clock_range_slider;

import 'package:flutter/material.dart';

import 'clock.dart';
import 'knob.dart';

class ClockRangeSlider extends StatelessWidget {
  final IconData icon1Data;
  final IconData icon2Data;
  final double diameter;
  final void Function(String) onIcon1RotatedCallback;
  final void Function(String) onIcon2RotatedCallback;
  final Color iconColor;
  final void Function(String)? setDurationCallback;
  final double? clockDiameter;
  final BoxDecoration? ringDecoration;
  final TextStyle? clockTextStyle;

  const ClockRangeSlider(
      {Key? key,
      required this.icon1Data,
      required this.icon2Data,
      required this.diameter,
      required this.onIcon1RotatedCallback,
      required this.onIcon2RotatedCallback,
      required this.iconColor,
      this.clockDiameter,
      this.ringDecoration,
      this.clockTextStyle,
      this.setDurationCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double clockRatio = 0.6;
    double gapRatio = 0.05;
    double innerGapRatio = 0.175;
    double knobWidth = 0.175;
    double knobInnerRadiusRatio = clockRatio + innerGapRatio;
    double knobOuterRadiusRatio = knobInnerRadiusRatio + knobWidth;
    assert(knobInnerRadiusRatio < knobOuterRadiusRatio &&
        knobOuterRadiusRatio < 1);
    return Container(
      width: diameter,
      height: diameter,
      child: Stack(
        children: [
          Knob(
            radius: diameter,
            innerRadiusRatio: knobInnerRadiusRatio,
            outerRadiusRatio: knobOuterRadiusRatio,
            onIcon1RotatedCallback: onIcon1RotatedCallback,
            onIcon2RotatedCallback: onIcon2RotatedCallback,
            icon1Data: icon1Data,
            icon2Data: icon2Data,
            iconColor: iconColor,
            ringDecoration: ringDecoration,
          ),
          Padding(
            padding: EdgeInsets.all(diameter * gapRatio),
            child: Center(
              child: Clock(
                radius: diameter * clockRatio,
              ),
            ),
          ),
        ],
      ),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(218, 224, 238, 1),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.white,
            Color.fromRGBO(218, 224, 238, 1),
          ],
          stops: [0.1, 1],
        ),
      ),
    );
  }
}
