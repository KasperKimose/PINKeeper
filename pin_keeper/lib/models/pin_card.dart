import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pin_keeper/models/pin_button_model.dart';

/// Hard-coded pin card of [PINButtonModel]s.
final PINCard pinCard = fetchPinCardSync();

/// Fetches the pin card synchronously.
PINCard fetchPinCardSync() {
  return PINCard._sample();
}

class PINCard {

  static const List<PINButtonModel> _sample_pin_buttons = const <PINButtonModel>[
    const PINButtonModel(1, Colors.green),
    const PINButtonModel(2, Colors.yellow),
    const PINButtonModel(3, Colors.red),
    const PINButtonModel(4, Colors.green),
    const PINButtonModel(5, Colors.yellow),
    const PINButtonModel(6, Colors.blue),
    const PINButtonModel(7, Colors.green),
    const PINButtonModel(8, Colors.yellow),
    const PINButtonModel(9, Colors.green),
    const PINButtonModel(10, Colors.red),
    const PINButtonModel(11, Colors.blue),
    const PINButtonModel(12, Colors.red),
    const PINButtonModel(13, Colors.yellow),
    const PINButtonModel(14, Colors.blue),
    const PINButtonModel(15, Colors.red),
    const PINButtonModel(16, Colors.blue)
  ];

  final List<PINButtonModel> _pinCard;

  PINCard.empty() : _pinCard = [];

  PINCard._sample() : _pinCard = _sample_pin_buttons;

  bool get isEmpty => _pinCard.isEmpty;

  /// An immutable listing of the products.
  UnmodifiableListView<PINButtonModel> get pinCard =>
      UnmodifiableListView<PINButtonModel>(_pinCard);
}