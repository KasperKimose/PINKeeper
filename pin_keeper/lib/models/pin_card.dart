import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pin_keeper/models/pin_number.dart';

@immutable
class PINCard {

  final String name;
  final List<PINNumber> numbers;
  final List<PINNumber> card;

  PINCard({String name, List<PINNumber> numbers, List<PINNumber> card}):
      this.name = name ?? '',
      this.numbers = numbers ?? [],
      this.card = card ?? [
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

  PINCard addPIN({PINNumber number}){
    return PINCard(
      numbers: List.from(numbers)..add(number),
      card: card.map((n) => n.id == number.id ? n.updateNumber() : n).toList()
    );
  }

  static PINCard copyFrom({List<PINNumber> numbers}){
    return PINCard(
      numbers: numbers
    );
  }
}