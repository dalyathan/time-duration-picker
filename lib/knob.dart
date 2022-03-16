import 'dart:math';

import 'package:clock_range_slider/clock_calc.dart';
import 'package:flutter/material.dart';

import 'knob_painter.dart';

class Knob extends StatefulWidget {
  final double radius;
  final double innerRadiusRatio;
  final double outerRadiusRatio;
  final IconData icon1Data;
  final IconData icon2Data;
  final void Function(String) onIcon1RotatedCallback;
  final void Function(String) onIcon2RotatedCallback;
  final Color iconColor;
  void Function(String)? setDurationCallback;
  BoxDecoration? ringDecoration;
  Knob(
      {Key? key,
      required this.radius,
      required this.innerRadiusRatio,
      required this.outerRadiusRatio,
      required this.onIcon1RotatedCallback,
      required this.onIcon2RotatedCallback,
      required this.icon1Data,
      required this.icon2Data,
      required this.iconColor,
      this.setDurationCallback,
      this.ringDecoration})
      : super(key: key);

  @override
  State<Knob> createState() => _KnobState();
}

class _KnobState extends State<Knob> {
  late double icon1Angle;
  late Offset icon1Offset;
  late double icon2Angle;
  late Offset icon2Offset;
  late double iconWidthRatio;
  late double knobWidthRatio;
  late Offset boxCenter;
  final GlobalKey icon1Key = GlobalKey();
  final GlobalKey icon2Key = GlobalKey();

  @override
  void initState() {
    super.initState();
    knobWidthRatio = widget.outerRadiusRatio - widget.innerRadiusRatio;
    iconWidthRatio = knobWidthRatio * 0.5;
    double centerOffset = widget.radius * (0.5 - iconWidthRatio * 0.5);
    boxCenter = Offset(centerOffset, centerOffset);
    icon1Offset = icon2Offset = Offset(
        widget.radius *
            (widget.innerRadiusRatio +
                (1 - widget.outerRadiusRatio) * 0.5 +
                (knobWidthRatio - iconWidthRatio) * 0.5),
        centerOffset);
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => initializeOffsetsAndAngles(context));
    icon1Angle = 0;
    icon2Angle = pi;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(
              widget.radius * (1 - widget.outerRadiusRatio) * 0.5),
          child: ClipPath(
            clipper: KnobPainter(
              icon2Angle,
              icon1Angle,
              widget.radius *
                  (widget.outerRadiusRatio - widget.innerRadiusRatio),
            ),
            child: Container(
              height: widget.radius * widget.outerRadiusRatio,
              width: widget.radius * widget.outerRadiusRatio,
              decoration: widget.ringDecoration != null
                  ? widget.ringDecoration!.copyWith(shape: BoxShape.circle)
                  : BoxDecoration(shape: BoxShape.circle),
            ),
          ),
        ),
        Positioned(
            // key: bellIconKey,
            top: icon1Offset.dy,
            left: icon1Offset.dx,
            child: GestureDetector(
              onPanUpdate: (details) {
                Offset currentLocation = Offset(
                    icon1Offset.dx + details.delta.dx,
                    icon1Offset.dy + details.delta.dy);
                double x = currentLocation.dx - boxCenter.dx;
                double y = boxCenter.dy - currentLocation.dy;
                if (x >= 0) {
                  double angle = pi / 2 - atan(y / x);
                  setState(() {
                    icon1Angle = angle;
                    icon1Offset = getLocationOnCircle(currentLocation);
                  });
                } else {
                  double angle = pi / 2 - atan(y / x) + pi;
                  setState(() {
                    icon1Angle = angle;
                    icon1Offset = getLocationOnCircle(currentLocation);
                  });
                }
                widget.onIcon1RotatedCallback(
                    ClockCalculations.getTimeFromAngles(icon1Angle));
                if (widget.setDurationCallback != null) {
                  widget.setDurationCallback!(
                      ClockCalculations.getDurationFromAngles(
                          icon2Angle, icon1Angle));
                }
              },
              child: Container(
                width: widget.radius * iconWidthRatio,
                height: widget.radius * iconWidthRatio,
                decoration: widget.ringDecoration != null
                    ? widget.ringDecoration!.copyWith(shape: BoxShape.circle)
                    : BoxDecoration(shape: BoxShape.circle),
                child: Center(
                  key: icon1Key,
                  child: Icon(
                    widget.icon1Data,
                    size: widget.radius * iconWidthRatio * 0.8,
                    color: widget.iconColor,
                  ),
                ),
              ),
            )),
        Positioned(
            // key: bedIconKey,
            top: icon2Offset.dy,
            left: icon2Offset.dx,
            child: GestureDetector(
              onPanUpdate: (details) {
                Offset currentLocation = Offset(
                    icon2Offset.dx + details.delta.dx,
                    icon2Offset.dy + details.delta.dy);
                double x = currentLocation.dx - boxCenter.dx;
                double y = boxCenter.dy - currentLocation.dy;
                if (x >= 0) {
                  double angle = pi / 2 - atan(y / x);
                  setState(() {
                    icon2Angle = angle;
                    icon2Offset = getLocationOnCircle(currentLocation);
                  });
                } else {
                  double angle = pi / 2 - atan(y / x) + pi;
                  setState(() {
                    icon2Angle = angle;
                    icon2Offset = getLocationOnCircle(currentLocation);
                  });
                }
                widget.onIcon2RotatedCallback(
                    ClockCalculations.getTimeFromAngles(icon2Angle));
                if (widget.setDurationCallback != null) {
                  widget.setDurationCallback!(
                      ClockCalculations.getDurationFromAngles(
                          icon2Angle, icon1Angle));
                }
              },
              child: Container(
                width: iconWidthRatio * widget.radius,
                height: iconWidthRatio * widget.radius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  key: icon2Key,
                  child: Icon(
                    widget.icon2Data,
                    size: widget.radius * iconWidthRatio * 0.8,
                    color: widget.iconColor,
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Offset getLocationOnCircle(Offset currentLocation) {
    //C= corner of box, A= top left corner of revolving icon, O= center of box
    //every corner is measured from c, so O=(widget.radius * 0.5,widget.radius * 0.5)
    double circleRadius = widget.radius *
        (widget.outerRadiusRatio * 0.5 -
            (knobWidthRatio - iconWidthRatio) * 0.5 -
            iconWidthRatio * 0.5);
    //current OA= CA- CO
    double relativeX = currentLocation.dx - boxCenter.dx;
    double relativeY = currentLocation.dy - boxCenter.dy;
    //calculate norm of OA
    double oldlength = sqrt(relativeX * relativeX + relativeY * relativeY);
    //get the unit vector
    Offset unitVector = Offset(relativeX / oldlength, relativeY / oldlength);
    //get the location of the icon relative to the center of the box that lies on the purple circle
    //that means new OA
    Offset vectorFromCenter =
        Offset(unitVector.dx * circleRadius, unitVector.dy * circleRadius);
    // new CA= OA + CO
    Offset newOffset = Offset(
        boxCenter.dx + vectorFromCenter.dx, boxCenter.dy + vectorFromCenter.dy);
    return newOffset;
  }

  initializeOffsetsAndAngles(BuildContext context) {
    setState(() {
      icon1Offset = translateAndRotate(icon1Offset, icon1Angle);
      icon2Offset = translateAndRotate(icon2Offset, icon2Angle);
    });
  }

  Offset translateAndRotate(Offset vector, double angleInRadians) {
    double normalizedAngle = angleInRadians - pi / 2;
    Offset offsetFromBoxCenter =
        Offset(vector.dx - boxCenter.dx, vector.dy - boxCenter.dy);
    List<List<double>> rotatingFactor = [
      [cos(normalizedAngle), -sin(normalizedAngle)],
      [sin(normalizedAngle), cos(normalizedAngle)]
    ];
    Offset rotatedFromBoxCenter = Offset(
        rotatingFactor[0][0] * offsetFromBoxCenter.dx +
            rotatingFactor[0][1] * offsetFromBoxCenter.dy,
        rotatingFactor[1][0] * offsetFromBoxCenter.dx +
            rotatingFactor[1][1] * offsetFromBoxCenter.dy);
    return Offset(rotatedFromBoxCenter.dx + boxCenter.dx,
        rotatedFromBoxCenter.dy + boxCenter.dy);
  }
}
//
