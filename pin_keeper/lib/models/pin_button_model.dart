import 'package:flutter/material.dart';

class PINButtonModel {
  final int id;

  final Color color;

  const PINButtonModel(this.id, this.color);

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PINButtonModel && other.hashCode == hashCode;

  @override
  String toString() => "(id=$id)";
}