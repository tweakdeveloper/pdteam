import 'package:pdteam/schedule/schedule.dart';

class Day {
  final String date;
  final List<Shift> shifts;
  final bool isCurrentMonth;
  final bool isToday;

  Day({this.date, this.shifts, this.isCurrentMonth, this.isToday});
}
