import 'package:pin_keeper/helpers/optional.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/models/pin_number.dart';
import 'package:pin_keeper/selectors/selectors.dart';
import 'package:test/test.dart';

main(){
  group('Selector', (){
    test('Should return an Optional card based on id', () {
      final card = CreditCard();
      
      final cards = [card];
      
      expect(creditCardSelector(cards, card.id), Optional.of(card));
    });

    test('Should return an absent Optinal if the card is not found', () {
      final card = CreditCard(id: "1");

      final cards = [card];

      expect(creditCardSelector(cards, "2"), Optional.absent());
    });
  });
}