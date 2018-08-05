import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pin_keeper/models/pin_button.dart';

class PINButtonWidget extends StatefulWidget {
  final PINButton model;
  final GestureTapCallback onTap;
  final int number;

  PINButtonWidget({
    Key key,
    @required this.model,
    this.onTap,
    this.number
  }): super(key: key);


  @override
  _PINButtonWidgetState createState() => new _PINButtonWidgetState(model, onTap);
}

class _PINButtonWidgetState extends State<PINButtonWidget>{

  PINButton model;
  int number;
  GestureTapCallback onTap;

  _PINButtonWidgetState(model, onTap){
    this.model = model;
    this.onTap = onTap;
    this.number = model.number;
  }

  void _updateNumber(){
    setState(() {
      number != null ? number = (number+1)%10 : number = 0;
    });
    onTap();
  }

  @override
  void didUpdateWidget(PINButtonWidget oldWidget) {
    if(this.number != this.widget.number){
      this.number = null;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: model.color,
      child: new FlatButton(
        onPressed: _updateNumber,
        color: model.color,
        child: new Text(number != null ? number.toString() : '?'),
      ),
    );
  }
}