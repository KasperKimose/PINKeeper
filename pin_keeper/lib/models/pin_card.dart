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
        PINNumber(id: 1, color: Colors.green),
        PINNumber(id: 2, color: Colors.yellow),
        PINNumber(id: 3, color: Colors.red),
        PINNumber(id: 4, color: Colors.green),
        PINNumber(id: 5, color: Colors.yellow),
        PINNumber(id: 6, color: Colors.blue),
        PINNumber(id: 7, color: Colors.green),
        PINNumber(id: 8, color: Colors.yellow),
        PINNumber(id: 9, color: Colors.green),
        PINNumber(id: 10, color: Colors.red),
        PINNumber(id: 11, color: Colors.blue),
        PINNumber(id: 12, color: Colors.red),
        PINNumber(id: 13, color: Colors.yellow),
        PINNumber(id: 14, color: Colors.blue),
        PINNumber(id: 15, color: Colors.red),
        PINNumber(id: 16, color: Colors.blue)
      ];

  PINCard addPIN({PINNumber number}){
    return PINCard(
      numbers: numbers.map((n) => n.id == number.id ? number : n).toList(),
      card: card.map((n) => n.id == number.id ? number.updateNumber() : n).toList()
    );
  }

  static PINCard copyFrom({List<PINNumber> numbers}){
    return PINCard(
      numbers: numbers
    );
  }
}