import 'package:html/dom.dart' as dom;

import 'package:pdteam/schedule/schedule.dart';

class Schedule {
  final List<Week> weeks;

  Schedule({this.weeks});

  factory Schedule.fromHtml(dom.Document doc) {
    dom.Element calendar = doc.querySelector('.monthCalendar');
    List<Week> weeks = calendar.querySelectorAll('.week').map((week) {
      return Week(
        days: week.querySelectorAll('td').map((day) {
          return Day(
            isCurrentMonth: !day.classes.contains('dark'),
            date: new RegExp(r'\d+').firstMatch(day.text).group(0),
            shifts: day.querySelectorAll('.monthShiftBox').map<Shift>((shift) {
              final shiftattrs = shift.innerHtml.split('<br>');
              String skill = shiftattrs[2];
              int pos = skill.lastIndexOf('<a');
              skill =
                  pos != -1 ? skill.substring(0, skill.indexOf('<a')) : skill;
              return Shift(
                times: shiftattrs[1],
                skill: skill,
                color: RosterAppsColors[shift.classes.last] ?? 0x0,
              );
            }).toList(),
          );
        }).toList(),
      );
    }).toList();
    return Schedule(weeks: weeks);
  }
}
