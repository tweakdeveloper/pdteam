import 'package:flutter/material.dart';

import 'package:pdteam/schedule/schedule.dart';

class SchedulePage extends StatelessWidget {
  final String rosterAppsToken;

  const SchedulePage({Key key, this.rosterAppsToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScheduleView(
      token: rosterAppsToken,
    );
  }
}
