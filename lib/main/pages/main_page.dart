import 'package:flutter/material.dart';

import 'package:pdteam/main/main.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('My Schedule')),
      body: Center(
        child: ScheduleView(
          token: args.rosterAppsAuthToken,
        ),
      ),
    );
  }
}
