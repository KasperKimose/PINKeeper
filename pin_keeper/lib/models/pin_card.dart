import 'dart:collection';

import 'package:meta/meta.dart';
import 'package:pin_keeper/models/pin_button.dart';

@immutable
class PINCard {

  final List<PINButton> numbers;

  PINCard({List<PINButton> numbers = const []}):
    this.numbers = numbers;

  PINCard addPIN({PINButton number}){
    this.numbers.add(number);
    return PINCard(
      numbers: this.numbers
    );
  }

  static PINCard copyFrom({List<PINButton> numbers}){
    return PINCard(
      numbers: numbers
    );
  }
}