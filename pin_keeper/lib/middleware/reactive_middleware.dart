import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/creditcard.dart';

import 'package:pin_keeper/repository/reactive_cards_repository.dart';
import 'package:pin_keeper/repository/user_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreCardsRepository(
    ReactiveCardsRepository cardsRepository,
    UserRepository userRepository
){
  return [
    TypedMiddleware<AppState, InitAppAction>(
      _firestoreSignIn(userRepository),
    ),
    TypedMiddleware<AppState, ConnectToDataSourceAction>(
      _firestoreConnect(cardsRepository),
    ),
  ];
}

void Function(Store<AppState> store,
    InitAppAction action,
    NextDispatcher next
    ) _firestoreSignIn(UserRepository repository){
  return (store, action, next){
    next(action);

    repository.login().then((_){
      store.dispatch(ConnectToDataSourceAction);
    });
  };
}

void Function(Store<AppState> store,
    ConnectToDataSourceAction  action,
    NextDispatcher next
    ) _firestoreConnect(ReactiveCardsRepository repository){
  return (store, action, next){
    next(action);

    repository.cards().listen(
            (cards){
      store.dispatch(
          CreditCardsLoadedAction(
              cards: cards.map(CreditCard.fromEntity).toList()
          )
      );
    });
  };
}