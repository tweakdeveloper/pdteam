import 'package:flutter/material.dart';

import 'package:pdteam/main/main.dart';

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
          'RosterApps Home',
          'My Schedule',
        ][_selectedPage]),
      ),
      body: [
        HomePage(),
        SchedulePage(rosterAppsToken: args.rosterAppsAuthToken),
      ][_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
        ],
      ),
    );
  }
}
