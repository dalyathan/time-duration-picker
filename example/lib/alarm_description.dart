import 'package:flutter/material.dart';

class AlarmDescription extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String time;
  final double width;
  const AlarmDescription(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.width,
      required this.time})
      : super(key: key);

  @override
  _AlarmDescriptionState createState() => _AlarmDescriptionState();
}

class _AlarmDescriptionState extends State<AlarmDescription> {
  double horizontalPadding = 0.15;
  double verticalPadding = 0.1;
  double aspectRatio = 0.8;
  late double height;

  @override
  void initState() {
    super.initState();
    height = widget.width / aspectRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: height,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(252, 253, 255, 1),
            borderRadius: BorderRadius.circular(widget.width * 0.25)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * verticalPadding,
              horizontal: widget.width * horizontalPadding),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.iconData,
                  color: const Color.fromRGBO(167, 153, 240, 1),
                  size: height * 0.3,
                ),
                SizedBox(
                  width: widget.width * (1 - 2 * horizontalPadding) * 0.65,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(widget.title,
                        style: const TextStyle(
                            color: Color.fromRGBO(
                              54,
                              61,
                              86,
                              1,
                            ),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                    width: widget.width * (1 - 2 * horizontalPadding),
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(widget.time,
                            style: const TextStyle(
                                color: Color.fromRGBO(
                                  54,
                                  61,
                                  86,
                                  1,
                                ),
                                fontWeight: FontWeight.bold)))),
                SizedBox(
                    width: widget.width * (1 - 2 * horizontalPadding) * 0.45,
                    child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Tomorrow",
                            style: TextStyle(
                                color: Color.fromRGBO(
                                  144,
                                  158,
                                  174,
                                  1,
                                ),
                                fontWeight: FontWeight.bold))))
              ]),
        ));
  }
}
