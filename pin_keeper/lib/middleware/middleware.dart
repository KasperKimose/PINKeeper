import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/selectors/selectors.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/repository/cards_repository.dart';
import 'package:pin_keeper/repository/file_storage.dart';
import 'package:pin_keeper/repository/repository.dart';
import 'package:redux/redux.dart';
import 'package:path_provider/path_provider.dart';

List<Middleware<AppState>> createStoreCreditCardsMiddleware([
  CardsRepository repository = const CardRepositoryFlutter(
    fileStorage: const FileStorage(
      '__pinkeeper__',
      getApplicationDocumentsDirectory,
    ),
  ),
]){

  final saveCards = _createSaveCards(repository);
  final loadCards = _createLoadCards(repository);

  return [
    TypedMiddleware<AppState, LoadCreditCardsAction>(loadCards),
    TypedMiddleware<AppState, AddCreditCardAction>(saveCards),
    TypedMiddleware<AppState, DeleteCreditCardAction>(saveCards),
    TypedMiddleware<AppState, CreditCardsLoadedAction>(saveCards),
  ];
}

Middleware<AppState> _createSaveCards(CardsRepository repository) {
  return(Store<AppState> store, action, NextDispatcher next){
    next(action);
    
    repository.saveCards(
        selectCreditCards(store.state).map((c) => c.toEntity()).toList());
  };
}

Middleware<AppState> _createLoadCards(CardsRepository repository) {
  return(Store<AppState> store, action, NextDispatcher next){
    repository.loadCards().then(
        (cards) {
          store.dispatch(
            CreditCardsLoadedAction(
              cards: cards.map(CreditCard.fromEntity).toList()
            )
          );
        },
    ).catchError((e) => store.dispatch(CreditCardsNotLoadedAction()));
    
    next(action);
  };
}