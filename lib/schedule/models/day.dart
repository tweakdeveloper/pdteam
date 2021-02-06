import 'package:pdteam/schedule/schedule.dart';

class Day {
  final String date;
  final List<Shift> shifts;
  final bool isCurrentMonth;

  Day({this.date, this.shifts, this.isCurrentMonth});
}