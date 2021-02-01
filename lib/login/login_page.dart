import 'package:flutter/material.dart';

import 'login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showSpinner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to RosterApps'),
        actions: [
          Visibility(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            ),
            visible: _showSpinner,
          ),
        ],
      ),
      body: LoginView(
        setSpinnerVisible: (shouldShowSpinner) {
          setState(() => _showSpinner = shouldShowSpinner);
        },
      ),
    );
  }
}
