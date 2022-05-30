library time_duration_picker;

import 'package:flutter/material.dart';
import 'package:time_duration_picker/Utils/simple_time.dart';

import 'Clock/clock.dart';
import 'Knob/knob.dart';

class TimeDurationPicker extends StatelessWidget {
  final IconData icon1Data;
  final IconData icon2Data;
  final double radius;
  final Color iconColor;
  final BoxDecoration? knobDecoration;
  final BoxDecoration? knobBackgroundDecoration;
  final BoxDecoration? clockDecoration;
  final TextStyle? clockTextStyle;
  final bool twelveHourClock;
  final void Function(SimpleTime) onIcon1RotatedCallback;
  final void Function(SimpleTime) onIcon2RotatedCallback;
  final void Function(SimpleTime)? setDurationCallback;

  const TimeDurationPicker({
    Key? key,
    required this.icon1Data,
    required this.icon2Data,
    required this.radius,
    required this.onIcon1RotatedCallback,
    required this.onIcon2RotatedCallback,
    this.iconColor = Colors.white,
    this.knobDecoration,
    this.knobBackgroundDecoration,
    this.clockDecoration,
    this.clockTextStyle,
    this.setDurationCallback,
    this.twelveHourClock = true,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double clockRatio = 0.6;
    double clockKnobGap = 0.1;
    double knobWidth = 0.9 - (clockRatio + clockKnobGap);
    double knobInnerRadiusRatio = clockRatio + clockKnobGap + 0.1;
    double knobOuterRadiusRatio = knobInnerRadiusRatio + knobWidth;

    assert(knobInnerRadiusRatio < knobOuterRadiusRatio && knobOuterRadiusRatio <= 1);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (radius <= constraints.maxWidth && radius <= constraints.maxHeight) {
          return Container(
            width: radius,
            height: radius,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Knob(
                  radius: radius,
                  innerRadiusRatio: knobInnerRadiusRatio,
                  outerRadiusRatio: knobOuterRadiusRatio,
                  onIcon1RotatedCallback: onIcon1RotatedCallback,
                  onIcon2RotatedCallback: onIcon2RotatedCallback,
                  icon1Data: icon1Data,
                  icon2Data: icon2Data,
                  iconColor: iconColor,
                  knobDecoration: knobDecoration,
                  setDurationCallback: setDurationCallback,
                ),
                /*Padding(
                  padding: EdgeInsets.all(radius * gapRatio),
                  child: Center(
                    child: */Clock(
                      twelveHourClock: twelveHourClock,
                      radius: radius * clockRatio,
                      clockDecoration: clockDecoration,
                      clockTextStyle: clockTextStyle,
                    //),
                  //),
                ),
              ],
            ),
            decoration: knobBackgroundDecoration != null
              ? knobBackgroundDecoration!.copyWith(shape: BoxShape.circle,)
              : const BoxDecoration(shape: BoxShape.circle,)
          );
        }

        throw Exception("Max allowed size is ${constraints.maxWidth < constraints.maxHeight ? constraints.maxWidth : constraints.maxHeight}");
      }
    );
  }
}
