import 'package:flutter/material.dart';

class IndicatorDot extends StatelessWidget {
  final Color color;

  IndicatorDot({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 4,
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
