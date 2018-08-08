import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_keeper/containers/add_card_screen.dart';
import 'package:pin_keeper/helpers/localization.dart';
import 'package:pin_keeper/helpers/redux_localization.dart';
import 'package:pin_keeper/middleware/middleware.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/models/initial_card.dart';
import 'package:pin_keeper/presentation/home_screen.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:pin_keeper/reducers/app_state_reducer.dart';

void main() {
  runApp(new PINKeeper());
}


class PINKeeper extends StatelessWidget {

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: createStoreCreditCardsMiddleware(),
  );

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: ReduxLocalizations().appTitle,
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: [
            ArchSampleLocalizationsDelegate(),
            ReduxLocalizationsDelegate(),
          ],
          routes: {
            '/': (context) {
              return StoreBuilder<AppState>(
                builder: (BuildContext context, Store vm) {
                  return HomeScreen();
                },
              );
            },
            '/addCard': (context){
              return AddCardScreen();
            }
          },
        )
    );
  }
}