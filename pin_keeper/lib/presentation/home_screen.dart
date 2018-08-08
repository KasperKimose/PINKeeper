import 'package:flutter/material.dart';
import 'package:pin_keeper/containers/add_card_screen.dart';
import 'package:pin_keeper/containers/credit_cards.dart';
import 'package:pin_keeper/helpers/keys.dart';
import 'package:pin_keeper/helpers/redux_localization.dart';

class HomeScreen extends StatelessWidget{

  HomeScreen() : super(key: Keys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(ReduxLocalizations.of(context).appTitle),
      ),
      body: CreditCards(),
      floatingActionButton: new FloatingActionButton(
        key: Keys.addCardFab,
        onPressed: () {
          Navigator.pushNamed(context, "/addCard");
        },
        tooltip: "Add new card",
        child: new Icon(Icons.add),
      ),
    );
  }
}