import 'package:flutter/material.dart';

import 'package:pdteam/main/main.dart';

class DayPage extends StatelessWidget {
  final Day day;

  DayPage({Key key, @required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The ${day.date}')),
    );
  }
}
