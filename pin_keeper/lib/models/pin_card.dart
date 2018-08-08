import 'dart:collection';

import 'package:meta/meta.dart';
import 'package:pin_keeper/models/pin_number.dart';

@immutable
class PINCard {

  final List<PINNumber> numbers;

  PINCard({List<PINNumber> numbers = const []}):
    this.numbers = numbers;

  PINCard addPIN({PINNumber number}){
    this.numbers.add(number);
    return PINCard(
      numbers: this.numbers
    );
  }

  static PINCard copyFrom({List<PINNumber> numbers}){
    return PINCard(
      numbers: numbers
    );
  }
}