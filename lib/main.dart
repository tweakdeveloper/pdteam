import 'package:flutter/material.dart';

import 'package:pdteam/login/login.dart';
import 'package:pdteam/main/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDTeam',
      theme: ThemeData(
        primaryColor: Color(0xff005b94),
        accentColor: Color(0xff009451),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (_) => LoginPage(),
        '/main': (_) => MainPage(),
      },
    );
  }
}
