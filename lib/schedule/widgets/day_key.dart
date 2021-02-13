import 'package:flutter/material.dart';

import 'package:pdteam/schedule/schedule.dart';

enum FirstDay { monday, sunday }

class DayKey extends StatelessWidget {
  final FirstDay firstDay;

  DayKey({Key key, this.firstDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];
    if (firstDay == FirstDay.monday) {
      days.insert(0, 'Su');
    } else {
      days.add('Su');
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map<Widget>((day) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: CalendarLabel(text: day),
          ),
        );
      }).toList(),
    );
  }
}
