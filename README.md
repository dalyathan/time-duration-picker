<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A time picker for paired consecutive tasks. It lets you specify the icons for each of your actions and callbacks when the user rotates each icon. You can optionally give callback for the time duration, decorations for the knob, the knob background, the clock and also color for your icons. The time and duration values are not displayed by the TimeDurationPicker widget, instead they are passed to the callbacks provided.

# Fails to rebuild when screen rotates.

![](https://github.com/surafelMelese/time-duration-picker/raw/main/demos/main_demo.gif)
```dart
TimeDurationPicker(
  diameter: 300,
  icon1Data: Icons.notifications_none,
  icon2Data: Icons.bed,
  onIcon1RotatedCallback: (value) {
    setState(() {
      alarmTime = value;
    });
  },
  onIcon2RotatedCallback: (value) {
    setState(() {
      bedTime = value;
    });
  })
```
![](https://github.com/surafelMelese/time-duration-picker/raw/main/demos/demo1.gif)
```dart
TimeDurationPicker(
      diameter: 300,
      icon1Data: Icons.directions_car_outlined,
      icon2Data: Icons.local_gas_station_outlined,
      knobDecoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(218, 224, 238, 1),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(204, 43, 94, 1),
            Color.fromRGBO(117, 58, 136, 1),
          ],
          stops: [0.1, 1],
        ),
      ),
      clockTextStyle: const TextStyle(
          color: Colors.teal, fontWeight: FontWeight.bold)),
```

Inspired by [Iphone Alarm UI Design](https://dribbble.com/shots/17158885-Iphone-Alarm-UI-Design) by [Ghulam Rasool](https://dribbble.com/ghulaam-rasool)

