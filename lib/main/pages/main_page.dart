import 'package:flutter/material.dart';

import 'package:pdteam/home/home.dart';
import 'package:pdteam/main/main.dart';
import 'package:pdteam/schedule/schedule.dart';
import 'package:pdteam/trades/trades.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage;

  @override
  void initState() {
    super.initState();
    _selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    final MainArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text([
          'Announcements',
          'My Schedule',
          'My Trades',
        ][_selectedPage]),
      ),
      body: [
        HomePage(rosterAppsToken: args.rosterAppsAuthToken),
        SchedulePage(rosterAppsToken: args.rosterAppsAuthToken),
        TradesPage(),
      ][_selectedPage],
      drawer: Drawer(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text([
                'Announcements',
                'My Schedule',
                'My Trades',
              ][index]),
              leading: Icon([
                Icons.announcement,
                Icons.calendar_today,
                Icons.sync_alt,
              ][index]),
              onTap: () {
                _selectedPage = index;
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
