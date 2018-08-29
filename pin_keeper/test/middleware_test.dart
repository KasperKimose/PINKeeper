import 'dart:async';

import 'package:pin_keeper/middleware/middleware.dart';
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/repository/cards_repository.dart';
import 'package:pin_keeper/reducers/app_state_reducer.dart';
import 'package:mockito/mockito.dart';
import 'package:pin_keeper/repository/credit_card_entity.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

class MockCardsRepository extends Mock implements CardsRepository { }

main(){
  group('Save State Middleware', (){
    test('Should load the cards in reponse to a LoadCardsAction', (){
      final repository = MockCardsRepository();
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initialState(),
        middleware: createStoreCreditCardsMiddleware(repository),
      );

      final cards = [
        CreditCardEntity("1", "Test", []),
      ];

      when(repository.loadCards()).thenReturn(Future.value(cards));

      store.dispatch(LoadCreditCardsAction());

      verify(repository.loadCards());
    });
  });

  test('Should save the state on every update action', () {
    final repository = MockCardsRepository();
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initialState(),
      middleware: createStoreCreditCardsMiddleware(repository),
    );

    final card = CreditCard(name: "Test");

    store.dispatch(AddCreditCardAction(card: card));
    store.dispatch(DeleteCreditCardAction(id: card.id));

    verify(repository.saveCards((typed(any)))).called(2);
  });
}