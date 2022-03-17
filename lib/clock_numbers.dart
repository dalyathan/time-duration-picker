import 'package:flutter/material.dart';

class ClockNumbers extends StatelessWidget {
  final double width;
  final TextStyle? clockTextStyle;
  const ClockNumbers({Key? key, required this.width, this.clockTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = width * 0.06;
    TextStyle textStyle = clockTextStyle != null
        ? clockTextStyle!.copyWith(fontSize: fontSize)
        : TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: width * 0.05),
          child: Text(
            '12 AM',
            style: textStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '10',
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
                '8',
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
                '6 PM',
                style: textStyle,
              ),
              Text(
                '6 AM',
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
                '4',
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
                '2',
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
            '12 PM',
            style: textStyle,
          ),
        )
      ],
    );
  }
}
