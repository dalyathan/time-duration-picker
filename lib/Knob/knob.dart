import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_duration_picker/Utils/simple_time.dart';

import 'knob_clipper.dart';

class Knob extends StatefulWidget {
  final double radius;
  final double innerRadiusRatio;
  final double outerRadiusRatio;
  final IconData icon1Data;
  final IconData icon2Data;
  final Color iconColor;
  final BoxDecoration? knobDecoration;
  final void Function(SimpleTime) onIcon1RotatedCallback;
  final void Function(SimpleTime) onIcon2RotatedCallback;
  final void Function(SimpleTime)? setDurationCallback;
  final SimpleTime? icon1InitialValue;
  final SimpleTime? icon2InitialValue;

  const Knob({
    Key? key,
    required this.radius,
    required this.innerRadiusRatio,
    required this.outerRadiusRatio,
    required this.onIcon1RotatedCallback,
    required this.onIcon2RotatedCallback,
    required this.icon1Data,
    required this.icon2Data,
    required this.iconColor,
    this.setDurationCallback,
    this.knobDecoration,
    this.icon1InitialValue,
    this.icon2InitialValue,
  }) : super(key: key);

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
    _initializeValues();
  }

  void _initializeValues() {
    knobWidthRatio = widget.outerRadiusRatio - widget.innerRadiusRatio;
    iconWidthRatio = knobWidthRatio * 0.8;
    double centerOffset = widget.radius * (0.5 - iconWidthRatio * 0.5);
    boxCenter = Offset(centerOffset, centerOffset);
    icon1Offset = icon2Offset = Offset(widget.radius * (widget.innerRadiusRatio + (1 - widget.outerRadiusRatio) * 0.5 + (knobWidthRatio - iconWidthRatio) * 0.5), centerOffset);

    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeOffsetsAndAngles(context));

    icon1Angle = widget.icon1InitialValue?.toRadianAngle() ?? 0;
    icon2Angle = widget.icon2InitialValue?.toRadianAngle() ?? pi;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(widget.radius * (1 - widget.outerRadiusRatio) * 0.5),
              child: ClipPath(
                clipper: KnobClipper(
                  icon1Angle,
                  icon2Angle,
                  widget.radius * (widget.outerRadiusRatio - widget.innerRadiusRatio),
                ),
                child: Container(
                  height: widget.radius * widget.outerRadiusRatio,
                  width: widget.radius * widget.outerRadiusRatio,
                  decoration: widget.knobDecoration != null
                    ? widget.knobDecoration!.copyWith(shape: BoxShape.circle)
                    : const BoxDecoration(shape: BoxShape.circle),
                ),
              ),
            ),
            draggable(
              key: icon1Key,
              iconData: widget.icon1Data,
              offset: icon1Offset,
              onPositionChanged: (details) {
                Offset currentLocation = Offset(icon1Offset.dx + details.delta.dx, icon1Offset.dy + details.delta.dy);

                double x = currentLocation.dx - boxCenter.dx;
                double y = boxCenter.dy - currentLocation.dy;

                setState(() {
                  icon1Angle =  pi / 2 - atan(y / x) + (x >= 0 ? 0 : pi);
                  icon1Offset = _getLocationOnCircle(currentLocation, context);
                });

                widget.onIcon1RotatedCallback(SimpleTime.fromAngle(icon1Angle));
              }
            ),
            draggable(
              key: icon2Key,
              iconData: widget.icon2Data,
              offset: icon2Offset,
              onPositionChanged: (details) {
                Offset currentLocation = Offset(icon2Offset.dx + details.delta.dx, icon2Offset.dy + details.delta.dy);

                double x = currentLocation.dx - boxCenter.dx;
                double y = boxCenter.dy - currentLocation.dy;

                setState(() {
                  icon2Angle = pi / 2 - atan(y / x) + (x >= 0 ? 0 : pi);
                  icon2Offset = _getLocationOnCircle(currentLocation, context);
                });

                widget.onIcon2RotatedCallback(SimpleTime.fromAngle(icon2Angle));
              }
            ),
          ],
        );
      }
    );
  }

  Widget draggable({required Key key, required IconData iconData, required Offset offset, required Function(DragUpdateDetails) onPositionChanged,}){
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: GestureDetector(
        onPanUpdate: (details) {
          onPositionChanged(details);
          if (widget.setDurationCallback != null) widget.setDurationCallback!(SimpleTime.fromTimeBetweenAngles(icon1Angle, icon2Angle));
        },
        child: SizedBox(
          width: widget.radius * iconWidthRatio,
          height: widget.radius * iconWidthRatio,
          child: Center(
            key: key,
            child: Icon(iconData,
              size: widget.radius * iconWidthRatio * 0.8,
              color: widget.iconColor,
            ),
          ),
        ),
      ),
    );
  }

  Offset _getLocationOnCircle(Offset currentLocation, BuildContext context) {
    //C = corner of box, A = top left corner of revolving icon, O = center of box
    //every corner is measured from c, so O=(widget.radius * 0.5,widget.radius * 0.5)
    double circleRadius = widget.radius * (widget.outerRadiusRatio * 0.5 - (knobWidthRatio - iconWidthRatio) * 0.5 - iconWidthRatio * 0.5);

    //current OA= CA- CO
    double relativeX = currentLocation.dx - boxCenter.dx;
    double relativeY = currentLocation.dy - boxCenter.dy;

    //calculate norm of OA
    double oldlength = sqrt(relativeX * relativeX + relativeY * relativeY);

    //get the unit vector
    Offset unitVector = Offset(relativeX / oldlength, relativeY / oldlength);

    //get the location of the icon relative to the center of the box that lies on the purple circle
    //that means new OA
    Offset vectorFromCenter = Offset(unitVector.dx * circleRadius, unitVector.dy * circleRadius);

    // new CA = OA + CO
    Offset newOffset = Offset(boxCenter.dx + vectorFromCenter.dx, boxCenter.dy + vectorFromCenter.dy);

    // if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return newOffset;
    // }
    // return Offset(newOffset.dy, newOffset.dx);
  }

  _initializeOffsetsAndAngles(BuildContext context) {
    setState(() {
      icon1Offset = _translateAndRotate(icon1Offset, icon1Angle);
      icon2Offset = _translateAndRotate(icon2Offset, icon2Angle);
    });
  }

  Offset _translateAndRotate(Offset vector, double angleInRadians) {
    double normalizedAngle = angleInRadians - pi / 2;

    Offset offsetFromBoxCenter = Offset(vector.dx - boxCenter.dx, vector.dy - boxCenter.dy);

    List<List<double>> rotatingFactor = [
      [cos(normalizedAngle), -sin(normalizedAngle)],
      [sin(normalizedAngle), cos(normalizedAngle)]
    ];

    Offset rotatedFromBoxCenter = Offset(
      rotatingFactor[0][0] * offsetFromBoxCenter.dx + rotatingFactor[0][1] * offsetFromBoxCenter.dy,
      rotatingFactor[1][0] * offsetFromBoxCenter.dx + rotatingFactor[1][1] * offsetFromBoxCenter.dy
    );

    return Offset(rotatedFromBoxCenter.dx + boxCenter.dx, rotatedFromBoxCenter.dy + boxCenter.dy);
  }
}
