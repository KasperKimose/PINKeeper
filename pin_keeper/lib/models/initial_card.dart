import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pin_keeper/models/pin_button.dart';


class InitialCard {

  final List<PINButton> initialCard =
  [
    PINButton(1, Colors.green, null),
    PINButton(2, Colors.yellow,  null),
    PINButton(3, Colors.red, null),
    PINButton(4, Colors.green, null),
    PINButton(5, Colors.yellow, null),
    PINButton(6, Colors.blue , null),
    PINButton(7, Colors.green, null),
    PINButton(8, Colors.yellow, null),
    PINButton(9, Colors.green, null),
    PINButton(10, Colors.red, null),
    PINButton(11, Colors.blue, null),
    PINButton(12, Colors.red, null),
    PINButton(13, Colors.yellow, null),
    PINButton(14, Colors.blue, null),
    PINButton(15, Colors.red, null),
    PINButton(16, Colors.blue, null)
  ];

  InitialCard();

  @override
  bool operator ==(other) => other is InitialCard && other.hashCode == hashCode;

  /// An immutable listing of the products.
  UnmodifiableListView<PINButton> get() {
    return UnmodifiableListView<PINButton>(initialCard);
  }
}