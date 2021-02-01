import 'package:flutter/material.dart';

import 'package:html/dom.dart' as dom;

import 'package:pdteam/main/main.dart';

class Schedule {
  final List<Week> weeks;

  Schedule({this.weeks});

  factory Schedule.fromHtml(dom.Document doc) {
    dom.Element calendar = doc.querySelector('.monthCalendar');
    List<Week> weeks = calendar.querySelectorAll('.week').map((week) {
      return Week(
        days: week.querySelectorAll('td').map((day) {
          return Day(
            date: new RegExp(r'\d+').firstMatch(day.text).group(0),
          );
        }).toList(),
      );
    }).toList();
    return Schedule(weeks: weeks);
  }
}
