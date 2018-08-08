import 'package:meta/meta.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/models/pin_number.dart';

class UpdatePINNumberAction{
  final PINNumber number;

  UpdatePINNumberAction({
    @required this.number
  });
}

class ResetCardAction{}

class SaveCardAction{}

class AddCreditCardAction {
  final CreditCard card;

  AddCreditCardAction({
   @required this.card
  });

}

class DeleteCreditCardAction{
  final String id;

  DeleteCreditCardAction({
    this.id
  });
}

class LoadCreditCardsAction{
  LoadCreditCardsAction(List list);
}


class CardsNotLoadedAction { }