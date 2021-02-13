import 'package:flutter/material.dart';

import 'package:pdteam/schedule/schedule.dart';

class ScheduleCalendar extends StatelessWidget {
  final Schedule schedule;
  final int month;
  final FirstDay firstDay;

  ScheduleCalendar({this.schedule, this.month, this.firstDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
            DayKey(firstDay: firstDay),
          ] +
          schedule.weeks.map<Widget>(
            (week) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: week.days.map<Widget>((day) {
                  final dots = Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: day.shifts.map<Widget>((shift) {
                      return IndicatorDot(color: Color(shift.color));
                    }).toList(),
                  );
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
                                  builder: (context) => DayPage(
                                    day: day,
                                    month: day.isCurrentMonth ? month : null,
                                  ),
                                ));
                          },
                          child: Container(
                            decoration: day.isCurrentMonth
                                ? null
                                : BoxDecoration(
                                    color: Color(0x0f000000),
                                  ),
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      day.date,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                dots,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ).toList(),
    );
  }
}
