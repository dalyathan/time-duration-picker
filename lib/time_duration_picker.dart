library time_duration_picker;

import 'package:flutter/material.dart';
import 'package:time_duration_picker/Utils/simple_time.dart';

import 'Clock/clock.dart';
import 'Knob/knob.dart';

class TimeDurationPicker extends StatelessWidget {
  /// Knob's first icon
  final IconData icon1Data;

  /// Knob's second icon
  final IconData icon2Data;

  /// Widget's total radius
  final double size;

  /// Knob icon's colors
  final Color iconColor;

  /// Knob's color
  final BoxDecoration? knobDecoration;

  /// Knob's background
  final BoxDecoration? knobBackgroundDecoration;

  /// Clock container's box decoration
  final BoxDecoration? clockDecoration;

  /// Clock number's text style
  final TextStyle? clockTextStyle;

  /// Set this to true to have a clock using AM-PM
  final bool twelveHourClock;

  /// First icon's initial value
  final SimpleTime? icon1InitialValue;

  /// Second icon's initial value
  final SimpleTime? icon2InitialValue;

  /// Called back when the first icon is moved
  final void Function(SimpleTime) onIcon1Move;

  /// Called back when the second icon is moved
  final void Function(SimpleTime) onIcon2Move;

  /// Call back whenever an icon is moved
  final void Function(SimpleTime)? onIconMove;

  const TimeDurationPicker({
    Key? key,
    required this.icon1Data,
    required this.icon2Data,
    required this.size,
    required this.onIcon1Move,
    required this.onIcon2Move,
    this.iconColor = Colors.white,
    this.knobDecoration,
    this.knobBackgroundDecoration,
    this.clockDecoration,
    this.clockTextStyle,
    this.onIconMove,
    this.twelveHourClock = true,
    this.icon1InitialValue,
    this.icon2InitialValue,
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
        if (size <= constraints.maxWidth && size <= constraints.maxHeight) {
          return Container(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Knob(
                  radius: size,
                  icon1InitialValue: icon1InitialValue,
                  icon2InitialValue: icon2InitialValue,
                  innerRadiusRatio: knobInnerRadiusRatio,
                  outerRadiusRatio: knobOuterRadiusRatio,
                  onIcon1RotatedCallback: onIcon1Move,
                  onIcon2RotatedCallback: onIcon2Move,
                  icon1Data: icon1Data,
                  icon2Data: icon2Data,
                  iconColor: iconColor,
                  knobDecoration: knobDecoration,
                  setDurationCallback: onIconMove,
                ),
                Clock(
                  twelveHourClock: twelveHourClock,
                  radius: size * clockRatio,
                  clockDecoration: clockDecoration,
                  clockTextStyle: clockTextStyle,
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
