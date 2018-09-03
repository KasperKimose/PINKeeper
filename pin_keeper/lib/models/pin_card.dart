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
        PINNumber(id: 0), PINNumber(id: 1), PINNumber(id: 2), PINNumber(id: 3),
        PINNumber(id: 4), PINNumber(id: 5), PINNumber(id: 6), PINNumber(id: 7),
        PINNumber(id: 8), PINNumber(id: 9), PINNumber(id: 10), PINNumber(id: 11),
        PINNumber(id: 12), PINNumber(id: 13), PINNumber(id: 14), PINNumber(id: 15),
        PINNumber(id: 16), PINNumber(id: 17), PINNumber(id: 18), PINNumber(id: 19),
        PINNumber(id: 20), PINNumber(id: 21), PINNumber(id: 22), PINNumber(id: 23),
        PINNumber(id: 24), PINNumber(id: 25), PINNumber(id: 26), PINNumber(id: 27),
        PINNumber(id: 28), PINNumber(id: 29), PINNumber(id: 30), PINNumber(id: 31),
        PINNumber(id: 32), PINNumber(id: 33), PINNumber(id: 34), PINNumber(id: 35),
        PINNumber(id: 36), PINNumber(id: 37), PINNumber(id: 38), PINNumber(id: 39)
      ];

  PINCard addPIN({PINNumber number}){
    PINNumber updatedNumber = number.updateNumber();
    if(!numbers.contains(number)){
      numbers.add(updatedNumber);
    }
    return PINCard(
      numbers: numbers.map((n) => n.id == number.id ? updatedNumber : n).toList(),
      card: card.map((n) => n.id == number.id ? updatedNumber : n).toList()
    );
  }

  static PINCard copyFrom({List<PINNumber> numbers}){
    return PINCard(
      numbers: numbers
    );
  }
}