import 'package:flutter/material.dart';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

import 'package:pdteam/trades/trades.dart';

class TradesPage extends StatefulWidget {
  final String rosterAppsToken;

  TradesPage({Key key, this.rosterAppsToken}) : super(key: key);

  @override
  _TradesPageState createState() => _TradesPageState();
}

class _TradesPageState extends State<TradesPage> {
  Future<List<Trade>> _trades;

  Future<List<Trade>> _fetchTrades() async {
    final response = await http.get(
      'https://aaregional.arcos-inc.com/Default.aspx',
      headers: {
        'Cookie': 'ROSTERAPPS.AUTH=${widget.rosterAppsToken}',
      },
    );
    if (response.statusCode == 200) {
      final doc = parse(response.body);
      final tradeTable = doc.getElementById('grdTradeRequest');
      List<Trade> trades = [];
      for (var trade in tradeTable.getElementsByClassName('gridItem')) {
        trades.add(Trade(
          coworker: trade.children[0].text.trim(),
          dateReceiving: trade.children[1].text.trim(),
          dateFor: trade.children[2].text.trim(),
        ));
      }
      return trades;
    } else {
      throw Exception('Unable to fetch trades');
    }
  }

  @override
  void initState() {
    super.initState();
    _trades = _fetchTrades();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trade>>(
      future: _trades,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                _trades = _fetchTrades();
              });
              await _trades;
              return null;
            },
            child: snapshot.data.isEmpty
                ? LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Text('You have no pending trades'),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Trade trade = snapshot.data[index];
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text('Trade with ${trade.coworker}'),
                            subtitle: Text(
                              trade.dateFor != ''
                                  ? '${trade.dateReceiving} for ${trade.dateFor}'
                                  : '${trade.dateReceiving}',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              '${snapshot.error}',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
