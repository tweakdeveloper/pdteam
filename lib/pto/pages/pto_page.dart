import 'package:flutter/material.dart';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

import 'package:pdteam/pto/pto.dart';

class PtoPage extends StatefulWidget {
  final String rosterAppsToken;

  PtoPage({Key key, this.rosterAppsToken}) : super(key: key);

  @override
  _PtoPageState createState() => _PtoPageState();
}

class _PtoPageState extends State<PtoPage> {
  Future<List<Pto>> _pto;

  Future<List<Pto>> _fetchPto() async {
    final response = await http.get(
      'https://aaregional.arcos-inc.com/Default.aspx',
      headers: {
        'Cookie': 'ROSTERAPPS.AUTH=${widget.rosterAppsToken}',
      },
    );
    if (response.statusCode == 200) {
      final doc = parse(response.body);
      final ptoList = doc.getElementById('ulAccrualAccounts');
      final numPtos = ptoList.children.length / 2;
      List<Pto> ptos = [];
      for (var i = 0; i < numPtos * 2; i += 2) {
        ptos.add(Pto(
          title: ptoList.children[i].text.trim(),
          description: ptoList.children[i + 1].text.trim(),
        ));
      }
      return ptos;
    } else {
      throw Exception('Unable to fetch PTO');
    }
  }

  @override
  void initState() {
    super.initState();
    _pto = _fetchPto();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pto>>(
      future: _pto,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                _pto = _fetchPto();
              });
              await _pto;
              return null;
            },
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].description),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error, style: TextStyle(color: Colors.red)),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
