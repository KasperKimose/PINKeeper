import 'package:meta/meta.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/models/initial_card.dart';
import 'package:pin_keeper/models/pin_button.dart';

@immutable
class AppState {
  final List<CreditCard> creditCards;
  final InitialCard card;
  final List<PINButton> numbers;

  AppState({
    this.card,
    this.creditCards = const [],
    this.numbers = const []
    });

  factory AppState.initialState() => AppState(card: InitialCard());
}