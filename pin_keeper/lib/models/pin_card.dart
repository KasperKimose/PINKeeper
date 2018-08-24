import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pin_keeper/helpers/colors_list.dart';
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
        PINNumber(id: 0, color: ColorList.colors[0]),
        PINNumber(id: 1, color: ColorList.colors[1]),
        PINNumber(id: 2, color: ColorList.colors[2]),
        PINNumber(id: 3, color: ColorList.colors[3]),
        PINNumber(id: 4, color: ColorList.colors[4]),
        PINNumber(id: 5, color: ColorList.colors[5]),
        PINNumber(id: 6, color: ColorList.colors[6]),
        PINNumber(id: 7, color: ColorList.colors[7]),
        PINNumber(id: 8, color: ColorList.colors[8]),
        PINNumber(id: 9, color: ColorList.colors[9]),
        PINNumber(id: 10, color: ColorList.colors[10]),
        PINNumber(id: 11, color: ColorList.colors[11]),
        PINNumber(id: 12, color: ColorList.colors[12]),
        PINNumber(id: 13, color: ColorList.colors[13]),
        PINNumber(id: 14, color: ColorList.colors[14]),
        PINNumber(id: 15, color: ColorList.colors[15])
      ];

  PINCard addPIN({PINNumber number}){
    if(numbers.contains(number)){
      numbers.map((n) => n.id == number.id ? number.updateNumber() : n).toList();
    } else numbers.add(number.updateNumber());
    return PINCard(
      numbers: numbers,
      card: card.map((n) => n.id == number.id ? number.updateNumber() : n).toList()
    );
  }

  static PINCard copyFrom({List<PINNumber> numbers}){
    return PINCard(
      numbers: numbers
    );
  }
}