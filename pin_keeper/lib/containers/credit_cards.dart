import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/presentation/credit_card_list.dart';
import 'package:pin_keeper/selectors/selectors.dart';
import 'package:redux/redux.dart';

class CreditCards extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm){
        return CreditCardList(
          cards: vm.cards,
          onUndoRemove: vm.onUndoRemove ,
          onRemove: vm.onRemove
        );
      },
    );
  }

}

class _ViewModel {
  final List<CreditCard> cards;
  final Function onUndoRemove;
  final Function onRemove;

  _ViewModel({
    @required this.cards,
    @required this.onUndoRemove,
    @required this.onRemove
  });

  static _ViewModel fromStore(Store<AppState> store){
      return _ViewModel(
        cards: selectCreditCards(store.state),
        onUndoRemove: (card) => store.dispatch(AddCreditCardAction(card: card)),
        onRemove: (card) => store.dispatch(DeleteCreditCardAction(id: card.id)),
      );
  }
}