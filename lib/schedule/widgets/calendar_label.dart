import 'package:flutter/material.dart';

class CalendarLabel extends StatelessWidget {
  final String text;
  final Color color;

  CalendarLabel({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color ?? Theme.of(context).textTheme.bodyText1.color,
        ),
      ),
    );
  }
}
