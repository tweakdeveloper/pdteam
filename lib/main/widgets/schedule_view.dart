import 'package:flutter/material.dart';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

import 'package:pdteam/main/main.dart';

class ScheduleView extends StatefulWidget {
  final String token;

  ScheduleView({@required this.token});

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  Future<Schedule> _schedule;
  int _month;

  Future<Schedule> _fetchSchedule() async {
    final dateString = '$_month%2F01%2F${DateTime.now().year}';
    final response = await http.get(
      'https://aaregional.arcos-inc.com/calendar.month.aspx?date=$dateString',
      headers: {
        'Cookie': 'ROSTERAPPS.AUTH=${widget.token}',
      },
    );
    if (response.statusCode == 200) {
      return Schedule.fromHtml(parse(response.body));
    } else {
      throw Exception('Couldn\'t load schedule');
    }
  }

  @override
  void initState() {
    super.initState();
    _month = DateTime.now().month;
    _schedule = _fetchSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _schedule = _fetchSchedule();
        });
        await _schedule;
        return null;
      },
      child: FutureBuilder<Schedule>(
        future: _schedule,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Center(
                  child: DropdownButton<int>(
                    value: _month,
                    items: [for (var i = 1; i <= 12; i++) i]
                        .map<DropdownMenuItem<int>>((val) {
                      return DropdownMenuItem(
                          value: val,
                          child: Text([
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December',
                          ][val - 1]));
                    }).toList(),
                    onChanged: (val) => setState(() {
                      _month = val;
                      _schedule = _fetchSchedule();
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ScheduleCalendar(schedule: snapshot.data),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Text(
                '${snapshot.error}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
