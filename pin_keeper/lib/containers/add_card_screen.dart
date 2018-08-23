import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/helpers/keys.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/creditcard.dart';
import 'package:pin_keeper/models/initial_card.dart';
import 'package:pin_keeper/models/pin_card.dart';
import 'package:pin_keeper/models/pin_number.dart';
import 'package:pin_keeper/presentation/add_screen.dart';
import 'package:pin_keeper/selectors/selectors.dart';
import 'package:redux/redux.dart';

class AddCardScreen extends StatelessWidget {

  AddCardScreen({
    Key key
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return AddScreen(
          key: Keys.addCardScreen,
          initialCard: vm.initialCard,
          onReset: vm.onReset,
          onSave: vm.onSave,
        );
      },
    );
  }
}

class _ViewModel {
  final PINCard initialCard;
  final Function onReset;
  final Function onSave;

  _ViewModel({
    @required this.initialCard,
    @required this.onReset,
    @required this.onSave
  });

  static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      initialCard: store.state.newCard,
      onReset: () => store.dispatch(ResetCardAction()),
      onSave: (name) {
        CreditCard card = CreditCard(name: name, numbers: store.state.newCard.numbers);
        store.dispatch(AddCreditCardAction(card: card));
      }
    );
  }
}