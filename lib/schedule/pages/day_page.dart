import 'package:flutter/material.dart';

import 'package:pdteam/schedule/schedule.dart';

class DayPage extends StatelessWidget {
  final Day day;
  final int month;

  DayPage({Key key, @required this.day, this.month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final monthString = month != null ? months[month - 1] : 'The';
    return Scaffold(
      appBar: AppBar(title: Text('$monthString ${day.date}')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            itemCount: day.shifts.length + 1,
            itemBuilder: (context, index) {
              if (day.shifts.length == 0) {
                return Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text('You have no shifts this day'),
                );
              }
              if (index == day.shifts.length) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: ColorsKey(),
                );
              }
              final shift = day.shifts[index];
              return Card(
                child: ListTile(
                  title: Text(shift.skill),
                  subtitle: Text(shift.times),
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(shift.color),
                    ),
                    width: 12,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
