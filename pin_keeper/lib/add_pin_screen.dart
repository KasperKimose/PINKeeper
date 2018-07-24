import 'package:flutter/material.dart';
import 'package:pin_keeper/models/initial_card.dart';
import 'package:pin_keeper/pin_card_bloc.dart';
import 'package:pin_keeper/pin_card_provider.dart';
import 'package:pin_keeper/widgets/pin_button_widget.dart';


class AddPINScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PINCardProvider(
      pinCardBloc: PINCardBloc(),
      child: new PINCard()
    );
  }
}

class PINCard extends StatelessWidget {

  void _saveCard() {}

  void _reset(){}

  @override
  Widget build(BuildContext context) {
    final pinCardBloc = PINCardProvider.of(context);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add PIN"),
        ),
        body: new Column(
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(
                  labelText: 'Name of your card',
                  icon: new Icon(Icons.credit_card)),
            ),
            new Container(
              alignment: Alignment.center,
              child: PINButtonGrid(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(8.0),
                  child: new FloatingActionButton(
                    onPressed: _reset,
                    heroTag: 'Reset',
                    tooltip: 'Reset the pin card',
                    child: new Icon(Icons.refresh),
                  ),
                ),
                new Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.all(8.0),
                    child: new FloatingActionButton(
                      onPressed: () => pinCardBloc.numbers.forEach(print),
                      heroTag: 'Save',
                      tooltip: "Save card",
                      child: new Icon(Icons.done),
                    )
                ),
              ],
            ),
          ],
        )
    );
  }

}

class PINButtonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pinCardBloc = PINCardProvider.of(context);
    return GridView.count(
      padding: const EdgeInsets.all(10.0),
      crossAxisCount: 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      shrinkWrap: true,
      children: initialCard.pinCard.map((button) {
        return PINButtonWidget(
          model: button,
          onTap: () {
            pinCardBloc.pinNumberAddition.add(PINNumberAddition(button));
          },
        );
      }).toList(),
    );
  }
}
