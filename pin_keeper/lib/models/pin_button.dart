import 'package:flutter/material.dart';

class PINButton {
  final int id;
  final Color color;

  int number = 0;

  PINButton(this.id, this.color);

  void updateNumber(){
    (number++) % 10;
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PINButton && other.hashCode == hashCode;

  @override
  String toString() => "(id=$id)";
}