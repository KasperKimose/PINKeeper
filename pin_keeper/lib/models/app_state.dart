import 'package:meta/meta.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/models/pin_card.dart';
import 'package:pin_keeper/models/pin_number.dart';

@immutable
class AppState {
  final List<CreditCard> creditCards;
  final PINCard newCard;

  AppState({
    this.creditCards = const [],
    this.newCard
    });

  factory AppState.initialState() => AppState(newCard: PINCard());
}