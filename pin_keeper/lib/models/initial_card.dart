import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pin_keeper/models/pin_number.dart';


class InitialCard {

  final List<PINNumber> initialCard =
  [
    PINNumber(1, Colors.green, null),
    PINNumber(2, Colors.yellow,  null),
    PINNumber(3, Colors.red, null),
    PINNumber(4, Colors.green, null),
    PINNumber(5, Colors.yellow, null),
    PINNumber(6, Colors.blue , null),
    PINNumber(7, Colors.green, null),
    PINNumber(8, Colors.yellow, null),
    PINNumber(9, Colors.green, null),
    PINNumber(10, Colors.red, null),
    PINNumber(11, Colors.blue, null),
    PINNumber(12, Colors.red, null),
    PINNumber(13, Colors.yellow, null),
    PINNumber(14, Colors.blue, null),
    PINNumber(15, Colors.red, null),
    PINNumber(16, Colors.blue, null)
  ];

  InitialCard();

  @override
  bool operator ==(other) => other is InitialCard && other.hashCode == hashCode;

  /// An immutable listing of the products.
  UnmodifiableListView<PINNumber> get() {
    return UnmodifiableListView<PINNumber>(initialCard);
  }
}