import 'package:flutter/material.dart';

import 'package:pdteam/main/main.dart';

class ScheduleCalendar extends StatelessWidget {
  final Schedule schedule;

  ScheduleCalendar({this.schedule});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            return Expanded(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: InkWell(
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
                      child: Center(
                        child: Text(day.date, textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
