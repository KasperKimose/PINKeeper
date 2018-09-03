
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/models/pin_number.dart';
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/selectors/selectors.dart';
import 'package:pin_keeper/reducers/app_state_reducer.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

main(){
  group('State Reducer', (){
    test('Should add a card to the list in response to an AddCreditCardAction', (){
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.initialState(),
      );

      final card = CreditCard(
          name: 'Test',
          numbers: [
            PINNumber(id: 0, number: 1),
            PINNumber(id: 1, number: 1),
            PINNumber(id: 2,number: 1),
            PINNumber(id: 3, number: 1)
          ]
      ).completeCard();

      store.dispatch(AddCreditCardAction(card: card));

      expect(selectCreditCards(store.state), [card]);
    });
  });

  test('Should remove from the list in response to a DeleteCreditCardAction', (){
    final card = CreditCard(name: 'Test');
    final store = Store<AppState>(
      appReducer,
      initialState: AppState(creditCards: [card])
    );
    
    expect(selectCreditCards(store.state), [card]);
    
    store.dispatch(DeleteCreditCardAction(id: card.id));
    
    expect(selectCreditCards(store.state), []);
  });
  
  test('Should update the pincard in reponse to UpdatePINNumberAction', (){
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initialState()
    );

    final number = PINNumber(id: 0, number: null);

    expect(selectPINNumber(store.state, number.id).number, null);
    expect(selectNumbers(store.state), []);

    store.dispatch(UpdatePINNumberAction(number: number));

    expect(selectPINNumber(store.state, number.id).number, 0);
    expect(selectNumbers(store.state), [number]);
  });

  test('Should update the pincard in reponse to 2 x UpdatePINNumberAction', (){
    final store = Store<AppState>(
        appReducer,
        initialState: AppState.initialState()
    );

    final number = PINNumber(id: 0, number: null);
    final number2 = PINNumber(id: 0, number: 0);

    expect(selectPINNumber(store.state, number.id).number, null);
    expect(selectNumbers(store.state), []);

    store.dispatch(UpdatePINNumberAction(number: number));

    expect(selectPINNumber(store.state, number.id), number);
    expect(selectNumbers(store.state), [number]);

    store.dispatch(UpdatePINNumberAction(number: number2));

    expect(selectPINNumber(store.state, number.id), number2);
    expect(selectNumbers(store.state), [number]);
  });

  test('Should reset card in reponse to ResetCardActions', (){
    final store = Store<AppState>(
        appReducer,
        initialState: AppState.initialState()
    );

    final number = PINNumber(id: 0, number: null);

    expect(selectPINNumber(store.state, number.id).number, null);
    expect(selectNumbers(store.state), []);

    store.dispatch(UpdatePINNumberAction(number: number));

    expect(selectPINNumber(store.state, number.id).number, 0);
    expect(selectNumbers(store.state), [number]);

    store.dispatch(ResetCardAction());

    expect(selectPINNumber(store.state, number.id).number, null);
    expect(selectNumbers(store.state), []);
  });
}