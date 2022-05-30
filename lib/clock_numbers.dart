import 'package:flutter/material.dart';

class ClockNumbers extends StatelessWidget {
  final double width;
  final TextStyle? clockTextStyle;
  final bool twelveHourClock;
  const ClockNumbers({Key? key, required this.width, this.clockTextStyle, this.twelveHourClock = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = width * 0.075;
    TextStyle textStyle = clockTextStyle != null
        ? clockTextStyle!.copyWith(fontSize: fontSize)
        : TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: width * 0.05),
          child: Text(
            twelveHourClock ? '12 AM' : '00',
            style: textStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                twelveHourClock ? '10' : '22',
                style: textStyle,
              ),
              Text(
                '2',
                style: textStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                twelveHourClock ? '8' : '20',
                style: textStyle,
              ),
              Text(
                '4',
                style: textStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                twelveHourClock ? '6 PM' : '18',
                style: textStyle,
              ),
              Text(
                twelveHourClock ? '6 AM' : '6',
                style: textStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                twelveHourClock ? '4' : '16',
                style: textStyle,
              ),
              Text(
                '8',
                style: textStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                twelveHourClock ? '2' : '14',
                style: textStyle,
              ),
              Text(
                '10',
                style: textStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: width * 0.05),
          child: Text(
            twelveHourClock ? '12 PM' : '12',
            style: textStyle,
          ),
        )
      ],
    );
  }
}
