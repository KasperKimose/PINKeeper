import 'dart:collection';

import 'package:pin_keeper/models/pin_button.dart';

class PINCard {

  final List<PINButton> _numbers = <PINButton>[];

  PINCard();

  /// This is the current state of the card.
  ///
  /// It is an unmodifiable view because we don't want a random widget to
  /// put the cart into a bad state. Use [add] and [remove] to modify the state.
  UnmodifiableListView<PINButton> get numbers => UnmodifiableListView(_numbers);

  void add(PINButton number){
    if(_numbers.isEmpty){
      number.updateNumber();
      _numbers.add(number);
    }
    else{
      for(PINButton n in _numbers){
        if(number == n){
          n.updateNumber();
        }
      }
      if(_numbers.length < 4){
        number.updateNumber();
        _numbers.add(number);
      }
    }
  }
}