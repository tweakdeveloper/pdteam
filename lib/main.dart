import 'package:flutter/material.dart';

import 'package:pdteam/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDTeam',
      theme: ThemeData(
        primaryColor: Color(0xffc5d4de),
        accentColor: Color(0xff009451),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (_) => LoginPage(),
      },
    );
  }
}
