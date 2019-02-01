
import 'package:pin_keeper/repository/credit_card_entity.dart';

abstract class ReactiveCardsRepository {

  Future<void> addNewCard(CreditCardEntity card);

  Future<void> deleteCard(List<String> ids);

  Stream<List<CreditCardEntity>> cards();
}