library clock_range_slider;

import 'package:flutter/material.dart';

class ClockRangeSlider extends StatelessWidget {
  final IconData icon1Data;
  final IconData icon2Data;
  final double diameter;
  final void Function(String) onIcon1RotatedCallback;
  final void Function(String) onIcon2RotatedCallback;
  final IconThemeData? iconThemeData;
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
      this.iconThemeData,
      this.clockDiameter,
      this.ringDecoration,
      this.clockTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (iconThemeData != null &&
        iconThemeData!.size != null &&
        clockDiameter != null) {
      assert(2 * iconThemeData!.size! + clockDiameter! > diameter,
          "Total diameter is less than the clock diameter plus icon size");
    } else if (clockDiameter != null) {
      assert(clockDiameter! > diameter, "Total size is than the clock size");
    }
    return Container();
  }
}
