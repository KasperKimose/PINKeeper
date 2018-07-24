import 'dart:async';
import 'package:rxdart/subjects.dart';


import 'package:pin_keeper/models/pin_button.dart';
import 'package:pin_keeper/models/pin_card.dart';

class PINNumberAddition{
  final PINButton number;

  PINNumberAddition(this.number);
}

class PINCardBloc  {

  final _numbers = BehaviorSubject<List<PINButton>>(seedValue: []);

  final StreamController<PINNumberAddition> _pinNumberAdditionController =
    StreamController<PINNumberAddition>();

  final _pinCard = PINCard();

  PINCardBloc(){
    _pinNumberAdditionController.stream.listen((addition) {
      _pinCard.add(addition.number);
      _numbers.add(_pinCard.numbers);
    });
  }

  Sink<PINNumberAddition> get pinNumberAddition => _pinNumberAdditionController;

  Stream<List<PINButton>> get numbers => _numbers.stream;

  void dispose() {
    _numbers.close();
    _pinNumberAdditionController.close();
  }
}