import 'package:flutter/material.dart';

import 'package:pdteam/main/main.dart';

class DayPage extends StatelessWidget {
  final Day day;

  DayPage({Key key, @required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The ${day.date}')),
      body: ListView.builder(
        itemCount: day.shifts.length,
        itemBuilder: (context, index) {
          final shift = day.shifts[index];
          return Card(
            child: ListTile(
              title: Text(shift.skill),
              subtitle: Text(shift.times),
              leading: Container(
                width: 5,
                color: Color(shift.color),
              ),
            ),
          );
        },
      ),
    );
  }
}
