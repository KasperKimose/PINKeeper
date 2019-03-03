import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_keeper/actions/actions.dart';
import 'package:pin_keeper/containers/add_card_screen.dart';
import 'package:pin_keeper/helpers/localization.dart';
import 'package:pin_keeper/helpers/redux_localization.dart';
import 'package:pin_keeper/middleware/middleware.dart';
import 'package:pin_keeper/middleware/reactive_middleware.dart';
import 'package:pin_keeper/models/app_state.dart';
import 'package:pin_keeper/presentation/home_screen.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_keeper/repository/firebase_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pin_keeper/repository/firebase_user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_keeper/repository/reactive_cards_repository.dart';
import 'package:pin_keeper/repository/user_repository.dart';
import 'package:redux/redux.dart';
import 'package:pin_keeper/reducers/app_state_reducer.dart';

void main([
  ReactiveCardsRepository cardsRepository,
  UserRepository userRepository
]) {
  runApp(new PINKeeper(
    cardsRepository: cardsRepository,
    userRepository: userRepository,
  ));
}

class PINKeeper extends StatelessWidget {
  final Store<AppState> store;

  PINKeeper({
    Key key,
    ReactiveCardsRepository cardsRepository,
    UserRepository userRepository
  }) : store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: createStoreCardsRepository(
      cardsRepository ??
          FirebaseRepository(FirebaseDatabase.instance),
      userRepository ??
          FirebaseUserRepository(FirebaseAuth.instance),
    ),
  ), super(key: key){
    store.dispatch(InitAppAction);
  }

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
            return HomeScreen();
          },
          '/addCard': (context){
            return AddCardScreen();
          }
        },
      )
    );
  }
}