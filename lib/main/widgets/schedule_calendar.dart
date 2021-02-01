import 'package:flutter/material.dart';

import 'package:pdteam/main/main.dart';

class ScheduleCalendar extends StatelessWidget {
  final Schedule schedule;

  ScheduleCalendar({this.schedule});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: schedule.weeks.map<Row>((week) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: week.days.map<Container>((day) {
              return Container(
                padding: EdgeInsets.all(8),
                child: Text(day.date),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
