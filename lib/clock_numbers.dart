import 'package:flutter/material.dart';

class ClockNumbers extends StatelessWidget {
  final double width;
  const ClockNumbers({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: width * 0.05),
          child: const Text(
            '12 AM',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '10',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '2',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '8',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '4',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '6 PM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '6 AM',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '4',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '8',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '2',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '10',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: width * 0.05),
          child: const Text(
            '12 PM',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
