import 'package:flutter/material.dart';
import 'dart:math';

class AddPINScreen extends StatefulWidget {
  AddPINScreen({Key key}) : super(key: key);

  @override
  _AddPINScreenState createState() => new _AddPINScreenState();
}

class _AddPINScreenState extends State<AddPINScreen> {
  List<String> _colors = ['R','R','R','R','R','R','R','R','R','R',
                          'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y',
                          'G','G','G','G','G','G','G','G','G','G',
                          'B','B','B','B','B','B','B','B','B','B'];
  Random rand = new Random();
  void _saveCard() {}

  int wtf = 0;

  String _getColor() {
    if(_colors.length == 0) return "";
    int i = rand.nextInt(_colors.length);
    return _colors.removeAt(i);
  }

  Widget buildPINRow(){
    return new Row(
      children: <Widget>[
        new PINButton(color: _getColor()),
        new PINButton(color: _getColor()),
        new PINButton(color: _getColor()),
        new PINButton(color: _getColor()),
        new PINButton(color: _getColor()),
        new PINButton(color: _getColor()),
        new PINButton(color: _getColor()),
        new PINButton(color: _getColor()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add PIN"),
      ),
      body: new Column(
        children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(
                labelText: 'Name of your card',
                icon: new Icon(Icons.credit_card)),
          ),
          new Center(
            child: new Column(
              children: <Widget>[
                buildPINRow(),
                buildPINRow(),
                buildPINRow(),
                buildPINRow(),
                buildPINRow()
              ],
            ),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _saveCard,
        tooltip: "Save card",
        child: new Icon(Icons.done),
      ),
    );
  }
}

class PINButton extends StatefulWidget{
  final String color;

  PINButton({Key key, this.color}) : super(key: key);

  @override
  _PINButtonState createState() => new _PINButtonState(color);
}

class _PINButtonState extends State<PINButton>{
  int _number = 0;
  Color _color;

  _PINButtonState(String color){
    if(color.contains('R')){
      _color = Colors.red;
    }
    else if(color.contains('Y')){
      _color = Colors.yellow;
    }
    else if(color.contains('B')){
      _color = Colors.blue;
    }
    else if(color.contains('G')){
      _color = Colors.green;
    }
  }

  void _updateNumber(){
    setState(() {
        _number = (_number+1)%10;
    });
  }

  Color _getColor(){
    return _color;
  }

  @override
  Widget build(BuildContext context) {
    return new Flexible(
        child: new FlatButton(
          onPressed: _updateNumber,
          color: _getColor(),
          child: new Text(_number.toString()),
        )
    );
  }
}
