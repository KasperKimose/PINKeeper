import 'package:meta/meta.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/models/initial_card.dart';
import 'package:pin_keeper/models/pin_number.dart';

@immutable
class AppState {
  final List<CreditCard> creditCards;
  final InitialCard card;
  //final List<PINNumber> numbers;

  AppState({
    this.card,
    this.creditCards = const []
    });

  factory AppState.initialState() => AppState(card: InitialCard());
}