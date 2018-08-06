import 'package:flutter/material.dart';
import 'package:pin_keeper/add_pin_screen.dart';
import 'package:pin_keeper/containers/credit_cards.dart';
import 'package:pin_keeper/helpers/localization.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(ReduxLocalizations.of(context).appTitle),
      ),
      body: CreditCards(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new AddPINScreen()),
          );
        },
        tooltip: "Add new card",
        child: new Icon(Icons.add),
      ),
    );
  }
}