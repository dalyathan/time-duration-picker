import 'package:flutter/material.dart';
import 'package:clock_range_slider/clock_range_slider.dart';

import 'alarm_description.dart';

class SetAlarm extends StatefulWidget {
  SetAlarm({Key? key}) : super(key: key);

  @override
  State<SetAlarm> createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  String alarmTime = "12:00 PM";
  String bedTime = "12:00 AM";
  String sleepDuration = "12 hr 00 min";
  @override
  Widget build(BuildContext context) {
    double smallerMarginRatio = 0.025;

    double horizontalPadding = 0.08;

    double verticalPadding = 0.05;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 248, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizontalPadding,
                vertical: size.height * verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SetAlarmTopRow(),
                SizedBox(height: size.height * smallerMarginRatio),
                ClockRangeSlider(
                  diameter: size.width * 0.775,
                  icon1Data: Icons.notifications_none,
                  icon2Data: Icons.bed,
                  knobDecoration: const BoxDecoration(
                      color: Color.fromRGBO(167, 153, 240, 1)),
                  knobBackgroundDecoration: const BoxDecoration(
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
                  onIcon1RotatedCallback: (value) {
                    setState(() {
                      alarmTime = value;
                    });
                  },
                  onIcon2RotatedCallback: (value) {
                    setState(() {
                      bedTime = value;
                    });
                  },
                  setDurationCallback: (value) {
                    setState(() {
                      sleepDuration = value;
                    });
                  },
                ),
                SizedBox(height: size.height * 2 * smallerMarginRatio),
                SizedBox(
                    width: size.width * 0.45,
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(sleepDuration,
                            style: const TextStyle(
                                color: Color.fromRGBO(
                                  54,
                                  61,
                                  86,
                                  1,
                                ),
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: size.height * 2 * smallerMarginRatio),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AlarmDescription(
                        iconData: Icons.bed,
                        title: "Bedtime",
                        width: size.width * 0.4,
                        time: bedTime),
                    AlarmDescription(
                        iconData: Icons.notifications_none,
                        title: "Wake Up",
                        width: size.width * 0.4,
                        time: alarmTime)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
