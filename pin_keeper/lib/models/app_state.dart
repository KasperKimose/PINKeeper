import 'package:meta/meta.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/models/pin_card.dart';

@immutable
class AppState {
  final List<CreditCard> creditCards;
  final PINCard newCard;
  final bool isLoading;

  AppState({
    this.creditCards = const [],
    this.newCard,
    this.isLoading = false
    });

  factory AppState.initialState() => AppState(isLoading: true, newCard: PINCard());
}