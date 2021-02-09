import 'package:flutter/material.dart';
import 'package:pdteam/schedule/schedule.dart';

class ColorDescription extends StatelessWidget {
  final int color;
  final String description;

  ColorDescription({Key key, this.color, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IndicatorDot(color: Color(color)),
        SizedBox(width: 8),
        Text(description),
      ],
    );
  }
}
