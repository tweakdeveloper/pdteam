import 'package:flutter/material.dart';

class CalendarLabel extends StatelessWidget {
  final String text;

  CalendarLabel({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
