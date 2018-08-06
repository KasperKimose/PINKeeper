import 'package:flutter/material.dart';

@immutable
class PINButton {

  final int id;
  final Color color;
  final int number;

  PINButton(this.id, this.color, this.number);

  PINButton copyWith({int id, Color color, int number}){
    return PINButton(
      id = id ?? this.id,
      color = color ?? this.color,
      number = number ?? this.number
    );
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PINButton && other.hashCode == hashCode;

  @override
  String toString() => "(id=$id, number=$number)";
}