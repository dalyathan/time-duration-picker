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
    return "${hour < 10 ? '0$hour' : hour}:${minutes < 10 ? '0$minutes' : minutes} $median";
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
    if (minutes == 60) {
      hourPart += 1;
      minutes = 0;
    }
    return "$hourPart hr $minutes min";
  }
}
