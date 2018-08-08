import 'package:flutter/material.dart';
import 'package:pin_keeper/models/pin_number.dart';

class PINButton extends StatelessWidget{

  final PINNumber number;
  final Function updateNumber;

  PINButton({
  Key key,
  @required this.number,
  @required this.updateNumber
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new FlatButton(
        onPressed: updateNumber,
        color: number.color,
        child: new Text(number.number != null ? number.number.toString() : '?'),
      ),
    );
  }
}