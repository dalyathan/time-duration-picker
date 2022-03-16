import 'dart:math';

class ClockCalculations {
  static String getTimeFromAngles(double angleInRadians) {
    String median = "AM";
    if (angleInRadians >= pi) {
      //PM part
      angleInRadians -= pi;
      median = "PM";
    }
    double ratio = angleInRadians / pi;
    double hoursInHundreds = ratio * 12;
    int hour = hoursInHundreds.floor();
    int minutes = ((hoursInHundreds - hour) * 60).ceil();
    if (minutes == 60) {
      hour += 1;
      minutes = 0;
    }
    if (hour == 0) {
      hour = 12;
    }
    if (minutes < 10 && hour < 10) {
      return "0$hour:0$minutes $median";
    } else if (minutes >= 10 && hour < 10) {
      return "0$hour:$minutes $median";
    } else if (minutes < 10 && hour >= 10) {
      return "$hour:0$minutes $median";
    } else {
      return "$hour:$minutes $median";
    }
  }

  static String getDurationFromAngles(
      double icon2AngleInRadians, double icon1AngleInRadians) {
    double totalAngle = 0.0;
    if (icon2AngleInRadians > icon1AngleInRadians) {
      totalAngle = 2 * pi - icon2AngleInRadians + icon1AngleInRadians;
    } else {
      totalAngle = icon1AngleInRadians - icon2AngleInRadians;
    }
    double totalHours = (totalAngle / (2 * pi)) * 24;
    int hourPart = totalHours.floor();
    int minutes = ((totalHours - hourPart) * 60).ceil();
    return "$hourPart hr $minutes min";
  }
}
