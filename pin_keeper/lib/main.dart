import 'dart:async';

import 'package:flutter/material.dart';

import 'models/creditcard.dart';
import 'database_helper.dart';
import 'add_pin_screen.dart';

void main() => runApp(new PINKeeper());

class PINKeeper extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PIN Keeper',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FrontPage(title: 'PIN Keeper'),
    );
  }
}

class FrontPage extends StatefulWidget {
  final String title;

  FrontPage({Key key, this.title}) : super(key: key);

  @override
  _FrontPageState createState() => new _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final _biggerFonts = const TextStyle(fontSize: 18.0);

  List<CreditCard> _cards;
  final _db = new DataBaseHelper();

  @override
  void initState() {
    super.initState();
    initCard().then((result) {
      setState(() {
        _cards = result;
      });
    });
  }

  Future<List<CreditCard>> initCard() async {
    return await _db.getCards();
  }

  void _newCard() {
    Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new AddPINScreen()),
            );
  }

  Widget _buildSuggestions() {
    if (_cards != null) {
      return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;

          return _buildRow(_cards[index]);
        },
      );
    } else {
      return new Center(
          child: new Text("There is no cards in your direcory",
              style: _biggerFonts));
    }
  }

  Widget _buildRow(CreditCard card) {
    return new ListTile(
      title: new Text(
        card.name,
        style: _biggerFonts,
      ),
      trailing: new Icon(Icons.arrow_forward),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: _buildSuggestions(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _newCard,
        tooltip: "Add new card",
        child: new Icon(Icons.add),
      ),
    );
  }
}
