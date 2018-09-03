
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:redux/redux.dart';

final cardReducer = combineReducers<List<CreditCard>>([
  TypedReducer<List<CreditCard>, AddCreditCardAction>(_addCard),
  TypedReducer<List<CreditCard>, DeleteCreditCardAction>(_deleteCard),
  TypedReducer<List<CreditCard>, CreditCardsLoadedAction>(_setLoadedCards),
  TypedReducer<List<CreditCard>, CreditCardsNotLoadedAction>(_setNoLoadedCards),
]);

List<CreditCard> _addCard(List<CreditCard> cards, AddCreditCardAction action){
  return List.from(cards)..add(action.card);
}

List<CreditCard> _deleteCard(List<CreditCard> cards, DeleteCreditCardAction action){
  return cards.where((card) => card.id != action.id).toList();
}

List<CreditCard> _setLoadedCards(List<CreditCard> cards, CreditCardsLoadedAction action){
  return action.cards;
}


List<CreditCard> _setNoLoadedCards(List<CreditCard> cards, CreditCardsNotLoadedAction action){
  return [];
}