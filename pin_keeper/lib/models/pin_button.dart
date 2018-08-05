import 'package:flutter/material.dart';

class PINButton {
  final int id;
  final Color color;

  int number;

  PINButton(this.id, this.color);

  void updateNumber(){
    if(number != null) (number++) % 10;
    else number = 0;
  }

  void reset(){
    number = null;
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PINButton && other.hashCode == hashCode;

  @override
  String toString() => "(id=$id, number=$number)";
}