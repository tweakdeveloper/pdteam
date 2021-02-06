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
      body: ListView.builder(
        itemCount: day.shifts.length,
        itemBuilder: (context, index) {
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
      ),
    );
  }
}
