import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/helpers/optional.dart';

List<CreditCard> selectCreditCards(AppState state) => state.creditCards;

Optional<CreditCard> creditCardSelector(List<CreditCard> cards, String id) {
  try{
    return Optional.of(cards.firstWhere((card) => card.id == id));
  } catch(e){
    return Optional.absent();
  }
}