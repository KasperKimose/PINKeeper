import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/pin_number.dart';
import 'package:pin_keeper/presentation/pin_button.dart';
import 'package:redux/redux.dart';

class PINButtons extends StatelessWidget{
  final PINNumber number;
  
  PINButtons({
    Key key,
    @required this.number
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.formStore(store, number),
      builder: (BuildContext context, _ViewModel vm) {
        return PINButton(
          number: vm.number,
          updateNumber: vm.updateNumber,
        );
      },
    );
  }
}

class _ViewModel {
  final PINNumber number;
  final Function updateNumber;
  
  _ViewModel({
    @required this.number,
    @required this.updateNumber
  });
  
  static _ViewModel formStore(Store<AppState> store, PINNumber number) {
    return _ViewModel(
      number: number,
      updateNumber: () => store.dispatch(UpdatePINNumberAction(number: number))
    );
  }
}