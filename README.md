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

A time picker for paired consecutive tasks. It lets you specify the icons for each of your actions and callbacks when the user rotates each icon. You can optionally give callback for the time duration, decorations for the knob, the knob background and also color for your icons. The time and duration values are not displayed by the TimeDurationPicker widget, instead they are passed to the callbacks provided.

## Features

![](https://github.com/surafelMelese/time-duration-picker/raw/main/demos/main_demo.gif)

## Usage
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
