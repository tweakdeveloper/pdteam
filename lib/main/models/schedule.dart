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
            shifts: day.querySelectorAll('.monthShiftBox').map<Shift>((shift) {
              final shiftattrs = shift.innerHtml.split('<br>');
              int color;
              switch (shift.classes.last) {
                case 'red':
                  {
                    color = 0xffe00000;
                  }
                  break;
                case 'blue':
                  {
                    color = 0xff0000ff;
                  }
                  break;
                case 'turquoise':
                  {
                    color = 0xff4ec9e5;
                  }
                  break;
                case 'purple':
                  {
                    color = 0xff960096;
                  }
                  break;
                default:
                  {
                    color = 0x0;
                  }
                  break;
              }
              return Shift(
                times: shiftattrs[1],
                skill: shiftattrs[2],
                color: color,
              );
            }).toList(),
          );
        }).toList(),
      );
    }).toList();
    return Schedule(weeks: weeks);
  }
}
