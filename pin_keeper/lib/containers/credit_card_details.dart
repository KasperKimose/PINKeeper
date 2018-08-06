import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/presentation/detail_screen.dart';
import 'package:pin_keeper/selectors/selectors.dart';
import 'package:redux/redux.dart';

class CreditCardDetails extends StatelessWidget{
  final String id;

  CreditCardDetails({
    Key key,
    @required this.id
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store){
        return _ViewModel.from(store, id);
      },
      builder: (context, vm){
        return DetailScreen(
          card: vm.card,
          onDelete: vm.onDelete,
        );
      },
    );
  }

}

class _ViewModel {
  final CreditCard card;
  final Function onDelete;

  _ViewModel({
    @required this.card,
    @required this.onDelete
  });

  factory _ViewModel.from(Store<AppState> store, String id) {
    final card =   creditCardSelector(selectCreditCards(store.state), id).value;

    return _ViewModel(
      card: card,
      onDelete: () => store.dispatch(DeleteCreditCard(id: card.id))
    );
  }
}