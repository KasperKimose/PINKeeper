import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'models/creditcard.dart';
import 'database_helper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PIN Keeper',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'PIN Keeper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _biggerFonts = const TextStyle(fontSize: 18.0);
  List<CreditCard> _cards;
  final _db = new DataBaseHelper();

  @override
  void initState() async {
    super.initState();
    _cards = await _db.getCards();
  }

  _newCard() {
    //Todo make new card page
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
