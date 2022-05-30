import 'package:flutter/material.dart';

class ClockNumbers extends StatelessWidget {
  final double radius;
  final TextStyle? clockTextStyle;
  final bool twelveHourClock;
  const ClockNumbers({Key? key, required this.radius, this.clockTextStyle, this.twelveHourClock = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = radius * 0.08;
    TextStyle textStyle = clockTextStyle != null
      ? clockTextStyle!.copyWith(fontSize: fontSize)
      : TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: radius * 0.02),
          child: Text(
            twelveHourClock ? '12 AM' : '0',
            style: textStyle,
          ),
        ),


        Padding(
          padding: EdgeInsets.symmetric(horizontal: radius * 0.2),
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

        const SizedBox(height: 30),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: radius * 0.06),
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

        const SizedBox(height: 35),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: radius * 0.02),
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

        const SizedBox(height: 35),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: radius * 0.06),
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

        const SizedBox(height: 30),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: radius * 0.2),
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
          padding: EdgeInsets.only(bottom: radius * 0.02),
          child: Text(
            twelveHourClock ? '12 PM' : '12',
            style: textStyle,
          ),
        )
      ],
    );
  }
}
