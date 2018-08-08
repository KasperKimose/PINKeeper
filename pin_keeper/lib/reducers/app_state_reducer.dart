import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/reducers/card_reducer.dart';
import 'package:pin_keeper/reducers/pin_card_reducer.dart';

AppState appReducer(AppState state, action){
  return AppState(
    creditCards: cardReducer(state.creditCards, action),
    newCard: pinCardReducer(state.newCard, action),
  );
}