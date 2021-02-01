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
  Future<Schedule> futureSchedule;

  Future<Schedule> fetchSchedule() async {
    final response = await http.get(
      'https://aaregional.arcos-inc.com/calendar.month.aspx',
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
    futureSchedule = fetchSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureSchedule,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ScheduleCalendar(schedule: snapshot.data),
              ],
            ),
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
    );
  }
}
