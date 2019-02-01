import 'package:pin_keeper/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, CreditCardsLoadedAction>(_setLoaded),
  TypedReducer<bool, CreditCardsNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}