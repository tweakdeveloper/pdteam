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
        children: schedule.weeks.map<Widget>((week) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: week.days.map<Widget>((day) {
              final decoration = day.shifts.length != 0
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    )
                  : null;
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayPage(day: day),
                      ));
                },
                child: Container(
                  decoration: decoration,
                  padding: EdgeInsets.all(8),
                  child: Text(day.date),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
