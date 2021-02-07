import 'package:flutter/material.dart';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

import 'package:pdteam/home/home.dart';

class HomePage extends StatefulWidget {
  final String rosterAppsToken;

  const HomePage({Key key, this.rosterAppsToken}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Announcements> _announcements;

  Future<Announcements> _fetchAnnouncements() async {
    final response = await http.get(
      'https://aaregional.arcos-inc.com/Default.aspx',
      headers: {
        'Cookie': 'ROSTERAPPS.AUTH=${widget.rosterAppsToken}',
      },
    );
    if (response.statusCode == 200) {
      return Announcements.fromHtml(parse(response.body));
    } else {
      throw Exception('Couldn\'t load announcements');
    }
  }

  @override
  void initState() {
    super.initState();
    _announcements = _fetchAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Announcements>(
      future: _announcements,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final announcement = snapshot.data.announcements[index];
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(announcement.title),
                    subtitle: Text(announcement.body),
                  ),
                ),
              );
            },
            itemCount: snapshot.data.announcements.length,
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              '${snapshot.error}',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
