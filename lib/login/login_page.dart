import 'package:flutter/material.dart';

import 'login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login to RosterApps')),
      body: LoginView(),
    );
  }
}
