import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pin_keeper/models/pin_button.dart';

/// Hard-coded pin card of [PINButtonModel]s.
final initialCard = new InitialCard();

class InitialCard {

  List<PINButton> _initialCard;

  int id;

  List<PINButton> _sample_pin_buttons = <PINButton>[
     PINButton(1, Colors.green),
     PINButton(2, Colors.yellow),
     PINButton(3, Colors.red),
     PINButton(4, Colors.green),
     PINButton(5, Colors.yellow),
     PINButton(6, Colors.blue),
     PINButton(7, Colors.green),
     PINButton(8, Colors.yellow),
     PINButton(9, Colors.green),
     PINButton(10, Colors.red),
     PINButton(11, Colors.blue),
     PINButton(12, Colors.red),
     PINButton(13, Colors.yellow),
     PINButton(14, Colors.blue),
     PINButton(15, Colors.red),
     PINButton(16, Colors.blue)
  ];

  InitialCard(){
    _initialCard = _sample_pin_buttons;
    id = 0;
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is InitialCard && other.hashCode == hashCode;

  bool get isEmpty => _initialCard.isEmpty;

  /// An immutable listing of the products.
  UnmodifiableListView<PINButton> get() {
    return UnmodifiableListView<PINButton>(_initialCard);
  }

  void reset() {
    id++;
    _initialCard.forEach((pinButton) => pinButton.reset());
  }
}