import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_keeper/helpers/localization.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/presentation/home_screen.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:pin_keeper/reducers/app_state_reducer.dart';

void main() => runApp(new PINKeeper());

class PINKeeper extends StatelessWidget {

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState()
  );

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: MaterialApp(
          title: ReduxLocalizations().appTitle,
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new HomeScreen(),
        )
    );
  }
}