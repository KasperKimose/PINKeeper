
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/models/pin_card.dart';
import 'package:redux/redux.dart';

final pinCardReducer = combineReducers<PINCard>([
  TypedReducer<PINCard, UpdatePINNumberAction>(_updatePINNumber),
  TypedReducer<PINCard, ResetCardAction>(_resetCard),
]);

PINCard _updatePINNumber(PINCard card, UpdatePINNumberAction action){
  return card.addPIN(number: action.number);
}

PINCard _resetCard(PINCard card, ResetCardAction action){
  return PINCard();
}