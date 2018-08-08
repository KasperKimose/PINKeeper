import 'package:flutter/material.dart';
import 'package:pin_keeper/containers/pin_buttons.dart';
import 'package:pin_keeper/helpers/keys.dart';
import 'package:pin_keeper/models/initial_card.dart';

class AddScreen extends StatelessWidget{

  static final GlobalKey<FormFieldState<String>> _nameKey = new GlobalKey();

  final InitialCard initialCard;
  final Function onReset;
  final Function onSave;

  AddScreen({
    Key key,
    @required this.initialCard,
    @required this.onReset,
    @required this.onSave
  }) : super(key: key ?? Keys.addCardScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add PIN'),
      ),
      body: new Column(
        children: <Widget>[
          new TextFormField(
            key: _nameKey,
            decoration: new InputDecoration(
                labelText: 'Name of your card',
                icon: new Icon(Icons.credit_card)),
          ),
          new Container(
            alignment: Alignment.center,
            child: GridView.count(
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              children: initialCard.get().map((button) {
                return PINButtons(
                  key: Keys.pinButton(button.id),
                  number: button,
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(8.0),
                child: new FloatingActionButton(
                  onPressed: () => onReset,
                  heroTag: 'Reset',
                  tooltip: 'Reset the pin card',
                  child: new Icon(Icons.refresh),
                ),
              ),
              new Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(8.0),
                  child: new FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    heroTag: 'Save',
                    tooltip: "Save card",
                    child: new Icon(Icons.done),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}