import 'package:meta/meta.dart';
import 'package:pin_keeper/models/creditcard.dart';

class AddPINNUmber{

}

class AddCreditCard {
  final CreditCard card;

  AddCreditCard({
   @required this.card
  });

}

class DeleteCreditCard{
  final String id;

  DeleteCreditCard({
    this.id
  });
}