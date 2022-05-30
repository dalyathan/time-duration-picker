import 'dart:math';

class SimpleTime {
  int hours = 0;
  int minutes = 0;

  SimpleTime.fromTime(this.hours, this.minutes);

  SimpleTime.fromAngle(double angle){ //angle in radians
    double angleInDegrees = angle * (180 / pi);
    int timeSinceMidday = (angleInDegrees.toInt() / 0.5) as int;

    hours = (timeSinceMidday / 30).floor(); //30 because we want 1 graduation = 2 minutes. On the clock, 1 "real" hour = 2 hours
    minutes = timeSinceMidday - 30 * hours;
  }

  SimpleTime.fromTimeBetweenAngles(double angle1, double angle2){
    SimpleTime time1 = SimpleTime.fromAngle(angle1);
    SimpleTime time2 = SimpleTime.fromAngle(angle2);

    hours = time1.hours == time2.hours ? 24 : time2.hours + ((time1.hours > time2.hours ? 24 : 0) - time1.hours);

    if(time1.minutes > time2.minutes) {
      minutes = (60 - time1.minutes) + time2.minutes;
      hours--;
    }
    else {
      minutes = time2.minutes - time1.minutes;
    }
  }

  double toRadianAngle(){
    return toDegreeAngle() * (pi/180);
  }

  double toDegreeAngle(){
    return 0.5 * (hours * 30 + minutes); //30 because we want 1 graduation = 2 minutes. On the clock, 1 "real" hour = 2 hours
  }

  @override
  String toString(){
    String time = "";

    time += "${hours < 10 ? "0" + hours.toString() : hours}:";
    time += minutes < 10 ? "0" + minutes.toString() : minutes.toString();

    return time;
  }

  String toDuration(){
    return "$hours hr $minutes min";
  }

  String toAMPMString(){
    String median = this.hours > 12 ? "PM" : "AM";

    String time = "";

    int hours = this.hours;
    if(this.hours > 12) hours -= 12;

    time += "${hours < 10 ? "0" + hours.toString() : hours}:";
    time += minutes < 10 ? "0" + minutes.toString() : minutes.toString();

    return "$time$median";
  }
}