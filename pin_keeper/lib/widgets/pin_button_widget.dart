import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pin_keeper/models/pin_button.dart';

class PINButtonWidget extends StatefulWidget {
  PINButton model;
  int _number;

  final GestureTapCallback onTap;

  PINButtonWidget({
    Key key,
    @required this.model,
    this.onTap
  }): super(key: key);


  @override
  _PINButtonWidgetState createState() => new _PINButtonWidgetState(model = model, onTap);
}

class _PINButtonWidgetState extends State<PINButtonWidget>{

  PINButton model;
  int _number;
  GestureTapCallback onTap;

  _PINButtonWidgetState(model, onTap){
    this.model = model;
    this.onTap = onTap;
  }

  void _updateNumber(){
    setState(() {
      _number != null ? _number = (_number+1)%10 : _number = 0;
    });
    onTap;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: model.color,
      child: new FlatButton(
        onPressed: _updateNumber,
        color: model.color,
        child: new Text(_number != null ? _number.toString() : '?'),
      ),
    );
  }
}